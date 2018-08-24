class MessagesController < ApplicationController

  def new
  end

  def create
    @message = Message.new(message_params)
    authorize @message
    @renting = Renting.find(params[:renting_id])
    @message.date = Time.now
    @message.user = current_user
    @message.renting_id = params[:renting_id]
    if @message.save
      respond_to do |format|
        format.html { redirect_to renting_path(params[:renting_id]) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'rentings/show' }
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end

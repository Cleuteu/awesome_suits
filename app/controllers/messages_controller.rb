class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.date = Time.now
    @message.user = current_user
    @message.renting_id = params[:renting_id]
    @message.save!
    authorize @message

    redirect_to renting_path(params[:renting_id])
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end

class RentingsController < ApplicationController
  before_action :set_renting, only: [:show, :edit, :update, :destroy]

  def create
    @renting = Renting.new(renting_params)
    @renting.user_id = current_user.id
    @renting.suit_id = Suit.find(params[:id])
    if @renting.save
      redirect_to renting_path(@renting)
    else
      render './suits/show'
    end
  end



  private

  def renting_params
    params.require(:renting).permit(:start_date, :end_date, :user_id, :suit_id)
  end

  def set_renting
    @renting = renting.find(params[:id])
  end


end

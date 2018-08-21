class RentingsController < ApplicationController
  before_action :set_renting, only: [:show, :edit, :update, :destroy]

  def create
    @suit = Suit.find(params[:suit_id])
    @renting = Renting.new(renting_params)
    @renting.user_id = current_user.id
    @renting.suit_id = @suit.id

    if @renting.save
      redirect_to suit_path(@suit)
    else
      render './suits/show'
    end
  end

  def destroy
    @renting.destroy!
    @suit = Suit.find(@renting.suit_id)
    redirect_to suit_path(@suit)
  end

  private

  def renting_params
    params.require(:renting).permit(:start_date, :end_date, :user_id, :suit_id)
  end

  def set_renting
    @renting = Renting.find(params[:id])
  end


end

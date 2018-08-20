class SuitsController < ApplicationController
  def new
    @suit = Suit.new
  end

  def create
    @suit = Suit.new(suit_params)
    @suit.user_id = current_user

    if @suit.save
      redirect_to suit_path(@suit)
    else
      render :new
    end
  end

  private

  def suit_params
    params.require(:suit).permit(:user_id, :color, :description, :style, :size)
  end
end

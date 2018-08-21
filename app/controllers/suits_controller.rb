class SuitsController < ApplicationController
  before_action :set_suit, only: [:show, :edit, :update, :destroy]

  def index
    @suits = Suit.all
  end

  def show
  end

  def new
    @suit = Suit.new
  end

  def create
    @suit = Suit.new(suit_params)
    @suit.user_id = current_user.id

    if @suit.save
      redirect_to suit_path(@suit)
    else
      render :new
    end
  end

  def destroy
    @suit.destroy!
    redirect_to owner_index_path
  end

  def owner_index
    @suits = Suit.where(user_id: current_user)
  end

  private

  def suit_params
    params.require(:suit).permit(:user_id, :color, :description, :style, :size, :name, :photo)
  end

  def set_suit
    @suit = Suit.find(params[:id])
  end
end

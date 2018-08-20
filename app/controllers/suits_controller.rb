class SuitsController < ApplicationController
  before_action :set_suit, only: [:show, :edit, :update, :destroy]
  def index
    @suits = Suit.all
  end
  
  private
  def set_suit
    @suit = Suit.find(params[:id])
  end
end

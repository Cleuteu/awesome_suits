class SuitsController < ApplicationController
  before_action :set_suit, only: [:show, :edit, :update, :destroy]
  def index
    @suits = Suit.all
  end
end

class RentingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_renting, only: [:show, :destroy, :update]

  def index
    @rentings = policy_scope(Renting).where(user_id: current_user).order(id: :desc)
    @owner_suits = policy_scope(Suit).where(user_id: current_user)
  end

  def create
    @suit = Suit.find(params[:suit_id])
    @renting = Renting.new(renting_params)
    @renting.user_id = current_user.id
    @renting.suit_id = @suit.id
    authorize @renting

    if @renting.save
      redirect_to rentings_path
    else
      render './suits/show'
    end
  end

  def show
    authorize @renting
    @suit = @renting.suit
    @owner = @renting.suit.user
    @review = Review.new
    @message = Message.new
    @messages = Message.where(renting_id: params[:id]).reverse_order
  end

  def update
    @renting.pending = false
    authorize @renting
    @renting.save
    redirect_to rentings_path
  end

  def destroy
    authorize @renting
    @renting.destroy!
    @suit = Suit.find(@renting.suit_id)
    if current_user == @suit.user
      redirect_to rentings_path
    else
    redirect_to suit_path(@suit)
    end
  end

  private

  def renting_params
    params.require(:renting).permit(:start_date, :end_date, :pending)
  end

  def set_renting
    @renting = Renting.find(params[:id])
  end


end

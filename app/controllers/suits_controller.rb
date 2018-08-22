class SuitsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_suit, only: [:show, :edit, :update, :destroy]

  def index
    @suits = policy_scope(Suit).order(created_at: :desc).where.not(latitude: nil, longitude: nil)

    @markers = @suits.map do |suit|
      {
        lat: suit.latitude,
        lng: suit.longitude#,
        # infoWindow: { content: render_to_string(partial: "/suits/map_box", locals: { suit: suit }) }
      }
    end
  end

  def show
    @renting = Renting.new
    @renting.suit = @suit
    @rentings = Renting.where(suit_id: @suit.id)
    @markers = @rentings.map do |renting|
      {
        from: renting.start_date,
        to: renting.end_date
      }
    end
    authorize @suit
    @marker =
      {
        lat: @suit.latitude,
        lng: @suit.longitude#,
        # infoWindow: { content: render_to_string(partial: "/suits/map_box", locals: { suit: suit }) }
      }
  end

  def new
    @suit = Suit.new
    authorize @suit
  end

  def create
    @suit = Suit.new(suit_params)
    @suit.user_id = current_user.id
    authorize @suit
    if @suit.save
      redirect_to suit_path(@suit)
    else
      render :new
    end
  end

  def edit
    authorize @suit
  end

  def update
    @suit.update!(suit_params)
    redirect_to suit_path(@suit)
    authorize @suit
  end

  def destroy
    @suit.destroy!
    redirect_to owner_index_path
  end

  def owner_index
    # @suits = Suit.where(user_id: current_user)
    @suits = policy_scope(Suit).where(user_id: current_user)
  end

  private

  def suit_params
    params.require(:suit).permit(:user_id, :color, :description, :style, :size, :name, :photo, :price_per_day, :address)
  end

  def set_suit
    @suit = Suit.find(params[:id])
  end
end

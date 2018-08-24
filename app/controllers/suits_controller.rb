class SuitsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_suit, only: [:show, :edit, :update, :destroy]

  def index
    # @suits = Suit.all
    # @suits(suit_params) = params[:query]
    @suits = policy_scope(Suit).order(created_at: :desc).where.not(latitude: nil, longitude: nil)

    # if params[:style].present? && params[:style][:style_selector] != ""
    #  @suits = policy_scope(Suit).order(created_at: :desc).where.not(latitude: nil, longitude: nil).where(style: params[:style][:style_selector])
    # elsif params[:color].present? && params[:color][:color_selector] != ""
    #   @suits = policy_scope(Suit).order(created_at: :desc).where.not(latitude: nil, longitude: nil).where(color: params[:color][:color_selector])
    # elsif params[:size].present? && params[:size][:size_selector] != ""
    #   @suits = policy_scope(Suit).order(created_at: :desc).where.not(latitude: nil, longitude: nil).where(size: params[:size][:size_selector])
    # end

    search_style
    search_size
    search_color


    @markers = @suits.map do |suit|
      {
        lat: suit.latitude,
        lng: suit.longitude,
        infoWindow: { content: render_to_string(partial: "/suits/map_box", locals: { suit: suit }) }
      }
    end
  end

  def show
    @renting = Renting.new
    @renting.suit = @suit
    @rentings = Renting.where(suit_id: @suit.id)
    @reviews = Review.all
    @rentings_dates = @rentings.map do |renting|
      {
        from: renting.start_date,
        to: renting.end_date
      }
    end
    authorize @suit
    @markers =[
      {
        lat: @suit.latitude,
        lng: @suit.longitude#,
        # infoWindow: { content: render_to_string(partial: "/suits/map_box", locals: { suit: suit }) }
      }]
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
      redirect_to owner_index_path(@suit)
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
    authorize @suit
  end

  def owner_index
    # @suits = Suit.where(user_id: current_user)
    @suits = policy_scope(Suit).where(user_id: current_user)
  end

  private

  def suit_params
    params.require(:suit).permit(:color, :description, :style, :size, :name, :photo, :price_per_day, :address)
  end

  def set_suit
    @suit = Suit.find(params[:id])
  end

  def search_style
    if params[:style].present? && params[:style][:style_selector] != ""
      @suits = policy_scope(Suit).order(created_at: :desc).where.not(latitude: nil, longitude: nil).where(style: params[:style][:style_selector])
    end
  end

  def search_color
    if params[:color].present? && params[:color][:color_selector] != ""
      @suits = policy_scope(Suit).order(created_at: :desc).where.not(latitude: nil, longitude: nil).where(color: params[:color][:color_selector])
    end
  end

  def search_size
    if params[:size].present? && params[:size][:size_selector] != ""
      @suits = policy_scope(Suit).order(created_at: :desc).where.not(latitude: nil, longitude: nil).where(size: params[:size][:size_selector])
    end
  end
end

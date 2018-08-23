class ReviewsController < ApplicationController

  def create
    @renting = Renting.find(params[:renting_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.renting = @renting
    @review.date = DateTime.now.to_date
    @review.save!
    authorize @review
    redirect_to suit_path(@renting.suit_id)
  end

  private

  def review_params
    params.require(:review).permit(:title, :rate, :date, :user_id, :renting_id)
  end
end

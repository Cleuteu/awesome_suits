class ReviewsController < ApplicationController

  def create
    @renting = Renting.find(params[:id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.renting = @renting
    @review.date = DateTime.now.to_date
    @review.save!
  end

  private

  def review_params
    params.require(:renting).permit(:title, :rate, :date, :user_id, :renting_id)
  end
end

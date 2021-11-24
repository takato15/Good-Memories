class Admin::ReviewsController < ApplicationController
  
  def index
    @reviews = Review.all
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path, notice: "口コミを削除しました。"
  end

  private

  def review_params
    params.require(:review).permit(:title, :evaluation, :contents, :customer_id)
  end
  
end

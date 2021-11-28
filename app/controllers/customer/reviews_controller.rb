class Customer::ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order(created_at: :desc).page(params[:page]).per(10)
    @reviews_all = Review.all
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    if @review.save
      redirect_to reviews_path, notice: "口コミを記載しました。"
    else
      render "new"
    end
  end

  def new
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to reviews_path, notice: "口コミを更新しました。"
    else
      render "edit"
    end
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

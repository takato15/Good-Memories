class Customer::HomesController < ApplicationController
  def index
    @photos = Home.all.order(created_at: :desc).page(params[:page]).per(9)
    @photos_all = Home.all
  end

  private

  def photo_params
    params.require(:home).permit(:image, :tag_id)
  end
end

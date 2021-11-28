class Admin::ReservesController < ApplicationController
  def index
    @reserves = Reserve.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  private

  def reserve_params
    params.require(:reserve).permit(:customer_id, :count, :reserve_day, :plan_name)
  end
end

class Admin::ReservesController < ApplicationController
  def index
    @reserves = Reserve.all.page(params[:page]).per(10)
  end

  private

  def reserve_params
    params.require(:reserve).permit(:customer_id, :count, :reserve_day, :plan_name)
  end
end

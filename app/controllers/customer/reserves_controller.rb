class Customer::ReservesController < ApplicationController

  def index
    @reserves = Reserve.where(customer_id: current_customer.id).page(params[:page]).per(10)
  end

  def new
    @reserve = Reserve.new
    @reserve_price = 8000
  end

  def confirm
    @reserve = Reserve.new(reserve_params)
    @reserve.customer_id = current_customer.id
    @reserve_price = 8000
  end

  def create
    @reserve = Reserve.new(reserve_params)
    if @reserve.save
      redirect_to complete_reserves_path
      # redirect_to confirm_reserves(@reserve.id)
    else
      render :new
    end
  end

  private

  def reserve_params
    params.require(:reserve).permit(:customer_id, :count, :reserve_day, :plan_name )
  end

end


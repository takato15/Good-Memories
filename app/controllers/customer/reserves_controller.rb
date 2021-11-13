class Customer::ReservesController < ApplicationController
  
  def index
    @reserves = Reserve.all
  end
  
  def new
    @reserve = Reserve.new
  end
  
  def create
    @reserve = Reserve.new(reserve_params)
    if @reserve.save
      redirect_to root_path
      # redirect_to confirm_reserves(@reserve.id)
    else
      render :new
    end
  end
  
  private

  def reserve_params
    params.require(:reserve).permit(:count, :reserve_day, :billing, :payment, :name, :post_cord, :address, :plan_name )
  end
  
end


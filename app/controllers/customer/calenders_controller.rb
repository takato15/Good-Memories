class Customer::CalendersController < ApplicationController
  
  def index
    @calenders = Calender.all
  end
  
  private

  def calender_parameter
    params.require(:blog).permit(:title, :start_at)
  end
  
end

class Customer::CalendersController < ApplicationController
  before_action :set_beginning_of_week

  def index
    @calenders = Calender.all
  end

  private

  def calender_parameter
    params.require(:blog).permit(:title, :start_at)
  end

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end
end

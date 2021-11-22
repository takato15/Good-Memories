class Admin::CalendersController < ApplicationController
  before_action :set_beginning_of_week
  
  def index
    @calenders = Calender.all
  end
  
  def new
    @calender = Calender.new
  end
  
  def show
    @calender = Calender.find(params[:id])
  end

  def create
    Calender.create(calender_parameter)
    redirect_to admin_calendes_path
  end

  def destroy
    @calender = Calender.find(params[:id])
    @calender.destroy
    redirect_to admin_calendes_path, notice:"削除しました"
  end

  def edit
    @calender = Calender.find(params[:id])
  end

  def update
    @calender = Calender.find(params[:id])
    if @calender.update(calender_parameter)
      redirect_to admin_calendes_path, notice: "編集しました"
    else
      render 'edit'
    end
  end
  
  private

  def calender_parameter
    params.require(:blog).permit(:title, :start_at)
  end
  
  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end
  
  
end

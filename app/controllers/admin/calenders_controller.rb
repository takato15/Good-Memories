class Admin::CalendersController < ApplicationController
  before_action :set_beginning_of_week

  def index
    @calenders = Calender.all
  end

  def new
    @calender = Calender.new
  end

  def create
    @calender = Calender.new(calender_params)
    if @calender.save
      redirect_to admin_calenders_path, notice: "スケジュールを追加しました。"
    else
      render "new"
    end
  end

  def edit
    @calender = Calender.find(params[:id])
  end

  def update
    @calender = Calender.find(params[:id])
    if @calender.update(calender_params)
      redirect_to admin_calenders_path, notice: "スケジュールを編集しました"
    else
      render "edit"
    end
  end

  private

  def calender_params
    params.require(:calender).permit(:title, :start_time)
  end

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end


end

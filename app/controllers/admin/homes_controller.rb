class Admin::HomesController < ApplicationController

  def index
    @photos = Home.all.order(created_at: :desc).page(params[:page]).per(9)
    @photos_all = Home.all

  end

  def show
    @photo = Home.find(params[:id])
  end

  def new
    @photo = Home.new
  end

  def create
    @photo = Home.new(home_params)
    if @photo.save
      redirect_to admin_home_path(@photo.id), notice: "写真を新規追加しました。"
    else
      render :new
    end
  end

  def edit
    @photo = Home.find(params[:id])
  end

  def update
    @photo = Home.find(params[:id])
    if @photo.update(home_params)
      redirect_to admin_home_path(@photo.id), notice: "写真情報を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @photo = Home.find(params[:id])
    @photo.destroy
    redirect_to admin_homes_path, notice: "写真を削除しました"
  end


  private

  def home_params
    params.require(:home).permit(:image, :tag_id)
  end

end

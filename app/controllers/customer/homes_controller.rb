class Customer::HomesController < ApplicationController
    
    def index
        @photos = Photo.all.order(created_at: :desc).page(params[:page]).per(10)
        @photos_all = Photo.all
    end
    
    private

    def photo_params
        params.require(:photo).permit(:image, :tag_id)
    end

end

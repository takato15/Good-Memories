class Customer::HomesController < ApplicationController
    
    def index
        @images = Image.all.order(created_at: :desc).page(params[:page]).per(10)
        @images_all = Image.all
    end
    
    private


    def image_params
        params.require(:image).permit(:tag_id)
    end

end

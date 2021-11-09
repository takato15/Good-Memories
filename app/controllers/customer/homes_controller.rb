class Customer::HomesController < ApplicationController

    def index
        @image = Image.all
    end

end

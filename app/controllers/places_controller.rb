class PlacesController < ApplicationController
        
    before_action :authenticate_user!, only: [:new, :create]
    
    def index
        @places = Place.all        
    end
    
    def create
        @places = current_user.places.create(place_params)
        if @places.valid?
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def show
        @place = Place.find(params[:id])
    end
    
    def edit
        @place = Place.find(params[:id])
    end
    
    def update
        @place = Place.find(params[:id])
        @place.update_attributes(place_params)
        redirect_to root_path
    end
    
    def new
        @places = Place.new
    end

    def destroy
        @place = Place.find(params[:id])
        @place.destroy
        redirect_to root_path
    end
    
    
    
    
    
    private

    def place_params
        params.require(:place).permit(:name, :description, :address)
    end

end

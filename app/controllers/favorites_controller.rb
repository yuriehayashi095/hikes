class FavoritesController < ApplicationController
    before_action :logged_in_user
    
    def create
        @hike = Hike.find(params[:hike_id])
        current_user.favorite(@hike)
    end
    
    def destroy
        @favorite = Favorite.find(params[:id])
        @hike = @favorite.favorite
        current_user.unfavorite(@hike)
    end
end
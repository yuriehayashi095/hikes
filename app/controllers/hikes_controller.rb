class HikesController < ApplicationController
    before_action :logged_in_user, only: [:create]

    def create
    @hike = current_user.hikes.build(hike_params)
        if @hike.save
        flash[:success] = "Yonda!"
        redirect_to root_url
        else
        @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
        render 'static_pages/home'
        end
    end

  def destroy
    @hike = current_user.hikes.find_by(id: params[:id])
    return redirect_to root_url if @hike.nil?
    @hike.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to request.referrer || root_url
  end
  
    def favorite
    @hike = hikes.find_by(id: params[:id])
    @hike.favorite
    flash[:success] = "iiku!しました"
    return redirect_to root_url
    
    @favorite_items = current_user.favorite_items.includes(:user).order(created at: :desc)
    render 'static_pages/favorite'
    end
  
    private
        def hike_params
        params.require(:hike).permit(:content, :content2, :content3, :description)
        end
end

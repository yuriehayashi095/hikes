class HikesController < ApplicationController
    before_action :logged_in_user, only: [:create]

    def create
    @hike = current_user.hikes.build(hike_params)
        if @hike.save
        flash[:success] = "Micropost created!"
        redirect_to root_url
        else
        render 'static_pages/home'
        end
    end

  def destroy
    @micropost = current_user.microposts.find_by(id: params[:id])
    return redirect_to root_url if @micropost.nil?
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end
  
    private
        def hike_params
        params.require(:hike).permit(:content)
        end
end

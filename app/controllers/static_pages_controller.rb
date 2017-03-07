class StaticPagesController < ApplicationController
  def home
    @hike = current_user.hikes.build if logged_in?
  end
end
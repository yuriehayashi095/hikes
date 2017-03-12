class UsersController < ApplicationController
before_action :logged_in_user, only: [:edit, :update]
before_action :check_user,     only: [:edit, :update]
  
  def show
   @user = User.find(params[:id])
   @hikes = @user.hikes.order(created_at: :desc)
  end
  
  def new
  @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Hikesへようこそ！"
      redirect_to @user
    else
      render 'new'
    end
  end
  
   # edit_user GET    /users/:id/edit(.:format) users#edit
  def edit
    @user = User.find(params[:id])
    # @user は編集対象のユーザー
    # current_user はログインしているユーザー    

  end
  
  def update
    if (@user.update(user_profile))
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "更新できませんでした"
      render "edit"
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @f_user = @user.following_users
  end
  
  def followers
    @user = User.find(params[:id])
    @fs_user = @user.follower_users
  end
  
  def favorites
    @user = User.find(params[:id])
    @favorites = @user.favorite_posts
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
  def user_profile
    params.require(:user).permit(:name, :email, :profile)
  end
  
  def check_user
    @user = User.find(params[:id])
    if (current_user != @user)
      redirect_to root_path
    end
  end
  
end
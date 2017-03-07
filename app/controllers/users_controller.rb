class UsersController < ApplicationController
  
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
  
  def edit
    # @user は編集対象のユーザー
    # current_user はログインしているユーザー    

  end
  
  def update
    if (@user.update(user_profile))
      redirect_to user_path(@user.id)
       # OKしょり
    else
      flash.now[:alert] = "更新できませんでした"
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
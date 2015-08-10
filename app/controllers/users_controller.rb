class UsersController < ApplicationController

  before_action :set_user, only: [:show, :index, :edit, :update, :followings, :followers]
  def show 
    @microposts = @user.microposts
  end
  
  def index
    @microposts = @user.microposts.page(params[:page]).per(10)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def followings
  end
  
  def followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,
                                 :comment)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end

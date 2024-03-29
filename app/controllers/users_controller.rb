class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    
  end

  def post
    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render action: :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  def show
     @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id]) 
    @user.destroy
    redirect_to root_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :gender)
  end
end

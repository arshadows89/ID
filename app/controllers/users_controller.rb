class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]

  def index
  	@user = current_user
  	@users = User.all 
  end

  def show
  end

  def edit
  	@user = current_user
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "User successfully created"
    else
      # redirect_to root_path, notice: "Failed to create an account"
      render '_form'
    end
  end

  def update
  		if @user.update(user_params)
  		redirect_to @user, notice: "User successfully updated."
  	end
  end

  def destroy
  	@user.destroy
  	redirect_to users_path, notice: "User was deleted."
  end

  private

  def set_user
  	@user = User.find(params[:id])
  end

  def user_params
  	params.require(:user).permit(:username, :password, :admin, :email)
  end

  # def current_user
  #   session[:user_id] ? User.find(session[:user_id]) :nil
  # end
end

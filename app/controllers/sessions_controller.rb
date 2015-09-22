class SessionsController < ApplicationController
	def create
		@user = User.where(:username => params[:user][:username].downcase).first

			if @user and @user.password == params[:user][:password]
				flash[:notice] = "Successfully signed in!"
				session[:user_id] = @user.id
        redirect_to root_path
			else
				flash[:alert] = "Something went wrong"
        redirect_to root_path
			end

	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "Logged out"
		redirect_to root_path
	end
end

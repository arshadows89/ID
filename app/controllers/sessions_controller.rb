class SessionsController < ApplicationController
	# def create
	# 	@user = User.where(:username => params[:user][:username].downcase).first
	# 	if @user and @user.password == params[:user][:password]
	# 		flash[:notice] = "Successfully signed in!"
	# 		session[:user_id] = @user.id
 #    		redirect_to root_path
	# 	else
	# 		flash[:alert] = "Something went wrong"
 #    		redirect_to root_path
	# 	end
	# end

	# def destroy
	# 	session[:user_id] = nil
	# 	flash[:notice] = "Logged out"
	# 	redirect_to root_path
	# end

def create
  user = User.where(:username => params[:user][:username].downcase).first
  if user && user.authenticate(params[:user][:password])
    if params[:user][:remember_me]
      cookies.permanent[:auth_token] = user.auth_token
    else
      cookies[:auth_token] = user.auth_token
    end
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Logged in!"
  else
    redirect_to root_url, :notice => "Invalid username or password"
  end
end

def destroy
	session[:user_id] = nil
  cookies.delete(:auth_token)
  redirect_to root_url, :notice => "Logged out!"
end

end

class SessionsController < ApplicationController
  def create
    session[:return_to] ||= request.referer
    user = User.where(:username => params[:user][:username].downcase).first
    if user && user.authenticate(params[:user][:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      session[:user_id] = user.id
      redirect_to session.delete(:return_to), :notice => "Logged in!"
    else
      redirect_to session.delete(:return_to), :notice => "Invalid username or password"
    end
  end

  def destroy
    # session[:return_to] ||= request.referer
    session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out!"
  end
end

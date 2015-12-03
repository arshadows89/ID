class AdminController < ApplicationController
  def index
  	@user = current_user
  	@users = User.all 
  end

  def streams
  	@streamer = Stream.all 
  end
end

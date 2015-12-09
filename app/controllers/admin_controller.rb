class AdminController < ApplicationController
  def index
  	@user = current_user
  	@users = User.all 
  end

  def streams
  	@streamer = Stream.all 
  end

  def videos
  	@videos = Video.all
  end

  def home

  end

  def recruitment
    @wowclassspec = Recruitment.new
  end
end

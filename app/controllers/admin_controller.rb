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
    @playlist = Playlist.find(1)
  end

  def adminupdate
  end

  def recruitment
    @recruitments = Recruitment.all
    @wowclassspec = Recruitment.new
  end

end

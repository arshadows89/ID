class VideosController < ApplicationController
  before_action :set_video, only: [:edit, :update, :show, :destroy]
  layout false
  layout 'application', :except => :new

  def index
  	@video = Video.all 
  end

  def show
  end

  def edit
  	@video = current_video
  end

  def new
  	@video = Video.new
  	render :layout => "../videos/new"
  end

  def create
  	@video = Video.new(video_params)
      if @video.save
       redirect_to videos_path, notice: "Video was successfully created"
      else
        render '_form'
    end
  end

  def update
  		if @video.update(video_params)
  		redirect_to root_path, notice: "Video successfully updated."
  	end
  end

  def destroy
  	@video.destroy
  	redirect_to root_path, notice: "Video was deleted."
  end

  private

  def set_video
  	@video = Video.find(params[:id])
  end

  def video_params
  	params.require(:video).permit(:link, :text)
  end

end

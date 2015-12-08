class VideosController < ApplicationController
  before_action :set_video, only: [:edit, :update, :show, :destroy]
  layout false
  layout 'application', :except => :new

  def index
    @videos = Video.all 
  end

  def show
  end

  def edit
    @video = current_video
    render :layout => "../videos/new"
  end

  def new
    @video = Video.new
    render :layout => "../videos/new"
  end

  def create
    @video = Video.new(video_params)
      if @video.save
        # respond_to do |format|
          # format.js { render :js => "my_function();" }
        #  end
       redirect_to home_closefb_path, notice: "Video was successfully created"
      else
        render :layout => "../videos/new"
    end
  end

  def update
    if @video.update(video_params)
      redirect_to home_closefb_path, notice: "Video successfully updated."
    else
      render :layout => "../videos/new"
    end

  end

  def destroy
    @video.destroy
    redirect_to admin_videos_path, notice: "Video was deleted."
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:text, :link)
  end

  def current_video
    Stream.find(params[:id])
  end

end

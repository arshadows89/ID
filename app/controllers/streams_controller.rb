class StreamsController < ApplicationController
  before_action :set_streamer, only: [:edit, :update, :show, :destroy]
  layout false
  layout 'application', :except => :new

  def index
  	@streamer = Stream.all 
  end

  def show
  end

  def edit
  	@streamer = current_streamer
    render :layout => "../streams/edit"
  end

  def new
  	@streamer = Stream.new
  	render :layout => "../streams/new"
  end

  def create
  	@streamer = Stream.new(stream_params)
      if @streamer.save
        # respond_to do |format|
          # format.js { render :js => "my_function();" }
        #  end
       redirect_to home_closefb_path, notice: "Stream was successfully created"
      else
        render :layout => "../streams/new"
    end
  end

  def update
  	if @streamer.update(stream_params)
  		redirect_to home_closefb_path, notice: "Stream successfully updated."
  	else
      render :layout => "../streams/edit"
    end
  end

  def destroy
  	@streamer.destroy
  	redirect_to admin_streams_path, notice: "Stream was deleted."
  end

  private

  def set_streamer
  	@streamer = Stream.find(params[:id])
  end

  def stream_params
  	params.require(:stream).permit(:link, :streamer)
  end

  def current_streamer
    Stream.find(params[:id])
  end

end

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
  	@streamer = current_user
  end

  def new

  	@streamer = Stream.new
  	  	render :layout => "../streams/new"
  end

  def create
  	@streamer = Stream.new(stream_params)
      if @streamer.save
       redirect_to streams_path, notice: "Stream was successfully created"
      else
        render '_form'
    end
  end

  def update
  		if @streamer.update(stream_params)
  		redirect_to root_path, notice: "Stream successfully updated."
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

end

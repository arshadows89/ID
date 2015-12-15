class HomepagenewsController < ApplicationController
  before_action :set_news, only: [:edit, :update, :show, :destroy]
  layout false
  layout 'application', :except => :new

  def edit
  	@homepagenew = current_news
    render :layout => "../homepagenews/edit"
  end

  def new
  	@homepagenew = Homepagenew.new
    render :layout => "../homepagenews/new"
  end

  def create
  	@homepagenew = Homepagenew.new(homepagenews_params)
      if @homepagenew.save
       redirect_to home_closefb_path, notice: "News section was successfully created"
      else
        render :layout => "../homepagenews/new"
    end
  end

  def update
  		if @homepagenew.update(homepagenews_params)
       redirect_to home_closefb_path, notice: "News section was successfully created"
    else
      render :layout => "../homepagenews/edit"
  	end
  end

  def destroy
  	@homepagenew.destroy
  	redirect_to admin_news_path, notice: "News section was deleted."
  end

  private

  def set_news
  	@homepagenew = Homepagenew.find(params[:id])
  end

  def homepagenews_params
  	params.require(:homepagenew).permit(:news, :title)
  end

  def current_news
    Homepagenew.find(params[:id])
  end
end

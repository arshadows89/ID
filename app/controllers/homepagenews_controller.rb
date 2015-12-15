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
        xid = 1
        x = 1
        Homepagenew.all.sort.reverse.each do |i|
        i.update(:homepage_id => xid)
          if x % 5 == 0
           xid += 1
          end
        x += 1
        end
        if Homepage.count != (Homepagenew.count / 5.to_f).ceil
          if Homepage.count > (Homepagenew.count / 5.to_f).ceil
            while Homepage.count != (Homepagenew.count / 5.to_f).ceil do
              Homepage.find(Homepage.count).destroy
            end
          elsif Homepage.count < (Homepagenew.count / 5.to_f).ceil
            while Homepage.count != (Homepagenew.count / 5.to_f).ceil do
              Homepage.create(:id => (Homepage.count + 1))
            end
          end
        end
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
    xid = 1
    x = 1
    Homepagenew.all.sort.reverse.each do |i|
    i.update(:homepage_id => xid)
    if x % 5 == 0
    xid += 1
    end
    x +=1
    end
    if Homepage.count != (Homepagenew.count / 5.to_f).ceil
      if Homepage.count > (Homepagenew.count / 5.to_f).ceil
        while Homepage.count != (Homepagenew.count / 5.to_f).ceil do
          Homepage.find(Homepage.count).destroy
        end
      elsif Homepage.count < (Homepagenew.count / 5.to_f).ceil
        while Homepage.count != (Homepagenew.count / 5.to_f).ceil do
          Homepage.create(:id => (Homepage.count + 1))
        end
      end
    end
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


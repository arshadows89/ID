class HomepageController < ApplicationController
  def show
    @homepage = current_page
  end

  def current_page
   @homepage = Homepage.find(params[:id])
  end
end

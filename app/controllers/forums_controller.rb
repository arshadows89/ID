class ForumsController < ApplicationController
  before_action :set_forum, only: [:edit, :update, :show, :destroy]
  layout false
  layout 'application', :except => :new

  def index
  	@forums = Forum.all
  	@forumtype = Forumtype.all
  end

  def show
    @forums = Forum.all
    @forumtype = Forumtype.all
  end

  def show_page
    @forums = Forum.all
    @forumtype = Forumtype.all
    @forum = Forum.find_by_title(params[:forum_id])
  end

  private

  def set_forum
    @forum = Forum.find_by_title(params[:id])
  end

end

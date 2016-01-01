class ForumpageController < ApplicationController
  before_action :set_forum, only: [:show]

  def show
    @forumpage = current_page
    @forums = Forum.all
    @forumtype = Forumtype.all
    @forum = set_forum
  end

  def current_page
   @forumpage = Forumpage.find(params[:id])
  end

private

  def set_forum
    @forum = Forum.find_by_title(params[:forum_id])
  end

end

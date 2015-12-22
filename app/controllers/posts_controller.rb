class PostsController < ApplicationController
  before_action :set_forum, only: [:edit, :update, :show, :destroy]
  before_action :set_post, only: [:edit, :update, :show, :destroy]

  def show 
  end

private

  def set_forum
    @forum = Forum.find_by_title(params[:forum_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end

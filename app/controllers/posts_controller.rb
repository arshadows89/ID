class PostsController < ApplicationController
  before_action :set_post, :set_forum_by_name, :set_forum, only: [:edit, :update, :show, :show_page, :destroy]
  before_action :set_forum_by_name, :set_forum, only: [:new, :create]

  def edit
    @post = set_post
    @forum = set_forum
  end

  def new
    @post = Post.new
    @forum = set_forum
  end

  def create
    @post = Post.new(post_params)
      if @post.save
       # redirect_to forum_path(current_forum), notice: "Post was successfully created"
       redirect_to forum_post_path(current_forum, Post.last), notice: "Post was successfully created"
      else
        render :new 
    end
  end

  def update
    @forum = set_forum
    if @post.update(post_params_update)
      redirect_to post_show_page_path(current_forum, current_post, (1)), notice: "Post was successfully updated"
    else
      render :edit 
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post was deleted."
    redirect_to(:back) 
  end

  def new_show_page
    @post = Post.new
    @forum = set_forum
  end

  def show_page
    @forum = set_forum
  end

private

  def set_user
    @user = session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def set_forum
    @forum = Forum.find_by_title(params[:forum_id])
  end

  def set_forum_by_name
    @forumname = Forum.find_by_title(params[:forum_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body, :title, :forum_id).merge(forum_id: current_forum.id, user_id: current_user.id)
  end

    def post_params_update
    params.require(:post).permit(:body, :title)
  end

  def current_user
    session[:user_id] ? User.find(session[:user_id]) :nil
  end

  def current_post
    Post.find(params[:id])
  end

  def current_forum
    Forum.find_by_title(params[:forum_id])
  end

end

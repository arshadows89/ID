class CommentsController < ApplicationController
  before_action :set_comment, :set_forum_by_name, :set_post, :set_forum, only: [:edit, :update, :show, :destroy]

  def edit
  	@comment = set_comment
    @post = set_post
    @forum = set_forum
  end

  def new
  	@comment = Comment.new
    @post = set_post
    @forum = set_forum
  end

  def create
  	@comment = Comment.new(comment_params)
      if @comment.save
       redirect_to forum_post_path(current_forum, current_post), notice: "Comment was successfully created"
      else
        redirect_to (new_forum_post_comment_path(current_forum, current_post)+ '#commentsubmit') 
    end
  end

  def update
    @forum = set_forum.id
  	if @comment.update(comment_params)
      redirect_to forum_post_path(current_forum, current_post), notice: "Comment was successfully updated"
  	else
      redirect_to (edit_forum_post_comment_path(current_forum, current_post, current_comment)+ '#commentsubmit') 
    end
  end

  def destroy
  	@comment.destroy
    flash[:notice] = "Comment was deleted."
  	redirect_to(:back) 
  end

  private

  def set_user
    @user = session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def set_forum
    @forum = Forum.find_by_title(params[:forum_id])
    # @forum = Forum.find(params[:forum_id])

    # if Forum.find(params[:forum_id]).nil? == true
    #   @forum = Forum.find_by_title(params[:forum_id])
    # else
    #   @forum = Forum.find(params[:forum_id])
    # end
  end

  def set_forum_by_name
    @forumname = Forum.find_by_title(params[:forum_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
  	@comment = Comment.find(params[:id])
  end

  def comment_params
  	params.require(:comment).permit(:body, :post_id).merge(post_id: current_post.id, user_id: current_user.id)
  end

  def current_comment
    Comment.find(params[:id])
  end

  def current_post
    Post.find(params[:post_id])
  end

  def current_user
    session[:user_id] ? User.find(session[:user_id]) :nil
  end

  def current_forum
    Forum.find_by_title(params[:forum_id])
  end

end

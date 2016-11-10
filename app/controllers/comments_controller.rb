class CommentsController < ApplicationController
  before_action :comment_set, only: [:destroy, :like, :dislike]


  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:name, :body))
    if @comment.save
      redirect_to @post
    else
      flash[:danger] = "Nickname/comment can't be blank or nickname has more
      than 20 characters."
      redirect_to request.referrer
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  def like
    @comment.liked_by current_user
    redirect_to request.referrer
  end

  def dislike
    @comment.disliked_by current_user
    redirect_to request.referrer
  end

  private

    def comment_set
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
    end

end

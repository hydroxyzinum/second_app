class PostsController < ApplicationController

  before_action :post_set, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.paginate(page: params[:page]).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      flash.now[:danger] = "Title/Post can't be blank."
      redirect_to 'posts/new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(params[:post].permit(:title, :body))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to blog_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

    def  post_set
      @post = Post.find(params[:id])
    end
  end

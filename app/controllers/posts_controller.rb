class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path(@post), notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @comments = @post.comments
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end

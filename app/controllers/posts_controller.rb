class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save!
      flash[:notice] = "Post was created."
      redirect_to @post
    else
      flash[:error] = "There was an error. Please try again."
      redirect_to :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy!
      flash[:notice] = "Post was deleted."
      redirect_to @post
    else
      flash[:error] = "There was an error. Please try again."
      render :index
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end

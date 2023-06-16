class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.author = User.find(params[:user_id])
    @user = User.find(params[:user_id])

    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post created successfully!'
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_user_post_path(@user)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :user_id)
  end
end

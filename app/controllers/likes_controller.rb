class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @like = @post.likes.new
    @like.author = current_user

    if @like.save
      redirect_to user_post_url(@user, @post), notice: 'Like created successfully!'
    else
      flash[:errors] = @like.errors.full_messages
      redirect_to user_post_url(@user, @post)
    end
  end
end

class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @comment = @post.comments.new(comment_params)
    @comment.author = current_user

    if @comment.save
      redirect_to user_post_url(@user, @post), notice: 'Comment created successfully!'
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to user_post_url(@user, @post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

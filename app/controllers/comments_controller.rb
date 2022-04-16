class CommentsController < ApplicationController
  def new
    @post_id = params[:post_id]
    @user_id = params[:user_id]
    @comment = Comment.new
  end

  def create
    user_id = params[:user_id]
    current_user = Users.where(id: user_id)[0]
    @comment = current_user.comments.new(post_id: params[:post_id])

    if @comment.save
      redirect_to "users/#{user_id}/posts/#{params[:post_id]}/comments/new", allow_other_host: true
    else
      @article = Posts.find(params[:post_id])
      redirect_to @article
    end
  end

  def created
    puts params
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

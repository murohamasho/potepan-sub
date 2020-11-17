class CommentsController < ApplicationController
  before_action :logged_in_user, only: :create
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      @micropost.create_notification_comment!(current_user, @comment.id)
      flash[:success] = 'Comment created!'
      redirect_to @micropost
    else
      @micropost = Micropost.find(params[:micropost_id])
      @user      = @micropost.user
      render 'microposts/show'
    end
  end

  def destroy
  end
  
  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end

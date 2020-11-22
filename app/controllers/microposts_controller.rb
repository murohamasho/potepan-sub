class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def show
    @micropost = Micropost.find_by(id: params[:id])
    @user      = @micropost.user
    @comment   = Comment.new #新規コメント用
    @comments  = @micropost.comments
  end
  
  def new
    @micropost  = current_user.microposts.build
    @user = current_user
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(params[:micropost][:image])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to @micropost
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'new'
    end
  end

  def destroy
    @user= @micropost.user
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to @user
  end
  
  

  private
    def micropost_params
      params.require(:micropost).permit(:content, :image)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end

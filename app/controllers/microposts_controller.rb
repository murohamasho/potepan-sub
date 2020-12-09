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
    @user = current_user
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to @micropost
    else
      render new_micropost_path
    end
  end

  def destroy
    @user= @micropost.user
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to @user
  end
  
  def search
    @microposts = Micropost.search(params[:search]).paginate(page: params[:page])
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

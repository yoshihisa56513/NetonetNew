class FeedsController < ApplicationController
  def show
  @user = User.find(params[:id])
  @microposts = @user.microposts.paginate(page: params[:page])
  @micropost = current_user.microposts.build if signed_in?
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to feed_url

    else

      @feed_items = []

      render 'static_pages/home'
    end
  end

  def feed_post

    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to feed_url

    else

      @feed_items = []

      render 'static_pages/home'
    end


  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end

end
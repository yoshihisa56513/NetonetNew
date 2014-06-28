class FeedsController < ApplicationController
  def show
  @user = User.find(params[:id])
  @microposts = @user.microposts.paginate(page: params[:page])
  @micropost = current_user.microposts.build if signed_in?
  end
end
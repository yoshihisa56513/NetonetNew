class ResponsesController < ApplicationController


  def show
    #@user = User.params[:id]
    #logger.debug(:id);
    @keijiban = Keijiban.find(params[:id])
    @responses = @keijiban.responses

    #logger.debug(@post)
    render :index
  end

  def create
    @keijiban = Keijiban.find(params[:keijiban_id])
    @response = @keijiban.responses.create(response_params)
    @response.user_id = current_user.id
    @response.save
    redirect_to :back
  end

  private

  def response_params
    params[:response].permit(:name, :content, :user_id)
  end
=begin
  def post_params
    params.require(:post).permit(:user_id, :post_user_id, :content)
  end
=end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_response
    @response = Response.find(params[:id])
  end
end

class KeijibansController < ApplicationController
  before_action :signed_in_user
  def index
    @keijibans = Keijiban.all
  end

  def show
    @keijiban = Keijiban.find(params[:id])
    @responses = @keijiban.responses
    #@responses.user_id = @current_user.id
  end

  def new
    @keijiban = Keijiban.new
  end

  def create
    @keijiban = Keijiban.new(keijiban_params)
    @keijiban.save
    redirect_to keijibans_path
  end

  private
  def keijiban_params
   params[:keijiban].permit(:title)
  end


  # Before actions

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end
  end

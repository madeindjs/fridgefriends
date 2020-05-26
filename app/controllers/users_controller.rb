class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    if params[:search].present?
      @users = User.search(params[:search])
    else
      @users = []
    end
    respond_to do |format|
      format.js
    end
  end
end

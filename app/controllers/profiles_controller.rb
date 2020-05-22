class ProfilesController < ApplicationController

  def show
    @user = current_user
    @donations = current_user.donations
  end

end

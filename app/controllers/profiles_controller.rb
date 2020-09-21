class ProfilesController < ApplicationController

  def show
    @user = current_user
    @donations = current_user.donations
  end

  def profile_params
  params.require(:profile).permit(:photo, :avatar)
end

end

class Users::RegistrationsController < Devise::RegistrationsController
  # DELETE /resource
  def destroy
    # resource.soft_delete
    resource.hard_delete
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end

  # def destroy
  #   if resource.didsomething
  #     redirect_to root_path, flash: { error: "You can't delete your account" }
  #   else
  #     super
  #   end
  # end
end

class Profile < ApplicationRecord
    
    def resource_name
        :user
    end

    def resource
    @resource ||= User.new
    end

    def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
    end
    
    private
    
    def add_default_avatar
        unless avatar.attached?
            avatar.attach(
            io: File.open(
                Rails.root.join(
                'app', 'assets', 'images', 'default_profile.jpg'
                )
            ), 
            filename: 'default_profile.jpg',
            content_type: 'image/jpg'
            )
        end
    end
end
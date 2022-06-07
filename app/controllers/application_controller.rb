class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        if current_user.type_id_type=="Rentel"
            rentels_path
        else
            libraryans_path
        end
    end
    before_action :set_active_storage_current_host
  
    def set_active_storage_current_host
      ActiveStorage::Current.host = request.base_url
    end

end

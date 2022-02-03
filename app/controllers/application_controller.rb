class ApplicationController < ActionController::Base
  before_action :redirect_to_landing

  private

    def redirect_to_landing
      unless current_user
        redirect_to root_url
      end
    end
end

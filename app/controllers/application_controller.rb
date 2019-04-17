class ApplicationController < ActionController::Base
  private

  def require_login
    unless current_user
      redirect_to new_user_session_url
    end
  end
end

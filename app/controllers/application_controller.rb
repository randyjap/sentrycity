class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    locale = params[:locale] || cookies[:locale] || I18n.default_locale
    cookies[:locale] = {
      :value => locale,
      :expires => 1.year.from_now,
    }
    I18n.locale = locale
  end

  private

  def require_login
    unless current_user
      redirect_to new_user_session_url
    end
  end
end

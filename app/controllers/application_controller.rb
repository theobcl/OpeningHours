class ApplicationController < ActionController::Base
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    redirect_to(root_path)
  end
end

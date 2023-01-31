class LanguagesController < ApplicationController
  def update
    session[:locale] = params[:locale]
    redirect_to request.referer || root_path
  end
end

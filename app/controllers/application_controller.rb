class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :render_single_page

  private

  def ensure_authenticated
    if session[:user_id].blank?
      render :json => { authorized: false }
    end
  end

  def render_single_page
    render 'layouts/application' if request.format == Mime::HTML
  end

end

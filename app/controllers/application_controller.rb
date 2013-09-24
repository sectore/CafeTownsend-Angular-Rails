class ApplicationController < ActionController::Base

  protect_from_forgery

  layout nil

  before_filter :intercept_html_requests

  private

  def ensure_authenticated
    if session[:user_id].blank?
      render :json => { authorized: false }
    end
  end

  def intercept_html_requests
    render 'layouts/application' if request.format == Mime::HTML
  end

end

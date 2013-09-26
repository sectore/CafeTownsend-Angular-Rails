class SessionsController < ApplicationController

  respond_to :json

  # POST /sessions
  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { user: user, authorized: 'true' }
    else
      #raise StandardError
      render json: { authorized: 'false' }
    end
  end


  # DELETE /sessions/1
  def destroy
    session[:user_id] = nil
    render json: { authorized: 'false' }
  end


end

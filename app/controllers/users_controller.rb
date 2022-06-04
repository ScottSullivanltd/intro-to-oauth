class UsersController < ApplicationController
  def show
  end

  def create
    auth_hash = request.env["omniauth.auth"]
    user = User.find_or_create_by(email: auth_hash[:info][:email])
    session[:access_token] = auth_hash[:credentials][:token]
    redirect_to "/dashboard"
  end
end

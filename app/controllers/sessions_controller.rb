require 'pry'
class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:user][:username])

    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @user=User.new if @user==nil
      @user.errors.add(:base, "Incorrect Username or Password")
      render :new
    end
  end

  def googleAuth
    # Get access tokens from the google server
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)

    # Access_token is used to authenticate request made from the rails application to the google server
    user.google_token = access_token.credentials.token
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save!
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def new
    @user=User.new
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end

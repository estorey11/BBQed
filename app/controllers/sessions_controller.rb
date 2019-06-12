class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:user][:username])

    return head(:forbidden) unless @user.try(:authenticate, params[:user][:password])
    session[:user_id] = @user.id

    redirect_to user_path(@user)
  end

  def create_google
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
    end

    session[:user_id] = @user.id

    render user_path(@user)
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

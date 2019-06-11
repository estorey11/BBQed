class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:user][:username])

    return head(:forbidden) unless @user.try(:authenticate, params[:user][:password])
    session[:user_id] = @user.id

    redirect_to controller: 'users', action: 'home'
  end

  def new
    @user=User.new
  end
end

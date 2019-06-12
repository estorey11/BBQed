class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:user][:username])

    return head(:forbidden) unless @user.try(:authenticate, params[:user][:password])
    session[:user_id] = @user.id

    redirect_to user_path(@user)
  end

  def new
    @user=User.new
  end

  def destroy
    session.clear
    redirect_to root_path
  end


end

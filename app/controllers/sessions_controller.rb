class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name])

    return head(:forbidden) unless @user.try(:authenticate, params[:user][:password])
    session[:user_id] = @user.id

    redirect_to controller: 'users', action: 'home'
  end
end

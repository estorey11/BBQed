class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def home
  end

  def show
    @user=User.find(session[:user_id])
    @recipes=@user.recipes

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @user }
    end

  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end

class WelcomeController < ApplicationController

  def home
    if helpers.logged_in?
      redirect_to user_path(helpers.current_user)
    end
  end
end

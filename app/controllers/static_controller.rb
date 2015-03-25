class StaticController < ApplicationController
  def home
    if current_user
      redirect_to dashboard_path
    else
      render "home"
    end
  end
end

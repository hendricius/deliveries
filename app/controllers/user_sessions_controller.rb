class UserSessionsController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    if @company = login(params[:email], params[:password])
      redirect_to dashboard_path
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "Logged out!"
  end
end

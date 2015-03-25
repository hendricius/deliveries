class CompaniesController < ApplicationController

  def dashboard
  end
  
  private

  def company_params
    params.require(:company).permit(:email, :password, :password_confirmation)
  end
end

class CompaniesController < ApplicationController
  private

  def company_params
    params.require(:company).permit(:email, :password, :password_confirmation)
  end
end

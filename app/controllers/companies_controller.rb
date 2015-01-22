class CompaniesController < ApplicationController

  respond_to :json

  def index
    @companies = Company.order(:name).map(&:name)
    respond_with(@companies)
  end

end
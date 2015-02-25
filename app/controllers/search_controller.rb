class SearchController < ApplicationController
  before_filter :valid_notice
  autocomplete :skill, :name
  before_action :set_domains
  respond_to :html, :json
  def index
    search = Profile.valid_users
    search = search.near(params[:qlocation]) if params[:qlocation].to_s.length > 0

    search = search.joins{skills}.where{skills.name.like_any my{params[:qskills].split(',').map { |s| "%#{s}%" }
}} if params[:qskills].to_s.length > 0


    search = search.where(domain_id: params[:qdomain]) if params[:qdomain].to_s.length > 0
    search = search.where("lower(university) LIKE ?", "%#{params[:qedu].downcase}%") if params[:qedu].to_s.length > 0

    @search = search.page(params[:page]).per(20)
    respond_with(@search)
  end


  private

    def set_domains
      @domains = Domain.all
    end
end

class SearchController < ApplicationController
  before_filter :valid_notice
  autocomplete :skill, :name
  before_action :set_domains
  respond_to :html, :json
  def index
    @search = Profile.valid_users
    @search = @search.near(params[:qlocation]) if params[:qlocation].to_s.length > 0
    @search = @search.joins(:skills).where(["skills.name IN (?)", params[:qskills].split(',')]) if params[:qskills].to_s.length > 0
    @search = @search.where(domain_id: params[:qdomain]) if params[:qdomain].to_s.length > 0
    @search = @search.where(university: params[:qedu]) if params[:qedu].to_s.length > 0

    # @search = Profile.valid_users.near(params[:qlocation]).page(params[:page]).per(20)

    # if params[:qlocation] == ""
    #   @search = @search.near(current_user.profile.address) if user_signed_in?
    # end

    @search = @search.page(params[:page]).per(20)
    respond_with(@search)
  end


  private

    def set_domains
      @domains = Domain.all
    end

    def active_user users
      user.where
    end

    def search(skill=nil, lat, log, within)
      if skill == nil
        search_list = Profile.near([lat, log], within, units: :km)
      else
        search_list = Profile.near([lat, log], within, units: :km).skills.where(name: skill)
      end
    end
end

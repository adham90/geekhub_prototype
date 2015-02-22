class SearchController < ApplicationController
  before_filter :valid_notice
  autocomplete :skill, :name
  before_action :set_domains
  respond_to :html, :json
  def index
    # lat    = params[:lan]    || current_user.profile.latitude
    # log    = params[:log]    || current_user.profile.longitude
    # within = params[:within] || 20
    # skill  = params[:skill]  || nil

    # @search = search *(set_params) || Profile.all
    # .where("skills.name" => "skill1")

    # @search = Profile.near(params[:location_address], 20).joins(:skills).where(skills: {:name => params[:skill_search]}).page(params[:page]).per(10)
    # if params[:skill_search] == "" || params[:skill_search] == nil
    #   unless params[:location_address] == nil
    #     @search = Profile.near(params[:location_address], 20).page(params[:page]).per(10)
    #   else
    #     @search = Profile.all.page(params[:page]).per(10)
    #   end
    # end
    # if params[:skill_search] == "" || params[:skill_search] == nil
    # # else
    # #   open_pair = []
    # #
    # #   current_user.profile.drives.where(done: false).each do |p|
    # #     open_pair << p.navigator.id
    # #   end
    # #
    # #   open_pair << current_user.profile.id
    # #   @search = Profile.not(id: open_pair).joins(:skills).where(skills: {:name => params[:skill_search]}).page(params[:page]).per(10)
    # end
    # # @search = Profile.near(params[:location_address], 400).page(params[:page]).per(10)
    #
    # if user_signed_in?
    #   # @search = @search.where.not(id: current_user.profile.id)
    # end

    # open_pair = []
    # if user_signed_in?
    #   current_user.profile.drives.where(done: false).each do |p|
    #     open_pair << p.navigator.id
    #   end
    #   open_pair << current_user.profile.id
    #   @search = Profile.where.not(id: open_pair).page(params[:page]).per(10)
    # else
    #   @search = Profile.all.page(params[:page]).per(10)
    # end


    @search = Profile.valid_users.page(params[:page]).per(20)

    unless params[:qlocation].present?
      @search = @search.near(current_user.profile.address) if user_signed_in?
    end

    respond_with(@search)
  end


  private

    def set_domains
      @domains = Domain.all.each { |c| c.ancestry = c.ancestry.to_s + (c.ancestry != nil ? "/" : '') + c.id.to_s
              }.sort {|x,y| x.ancestry <=> y.ancestry
              }.map{ |c| ["--" * (c.depth - 1) + c.name,c.id]
              }.unshift(["-- Domain --", nil])
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

class SearchController < ApplicationController
  autocomplete :skill, :name

  respond_to :html, :json
  def index
    # lat    = params[:lan]    || current_user.profile.latitude
    # log    = params[:log]    || current_user.profile.longitude
    # within = params[:within] || 20
    # skill  = params[:skill]  || nil

    # @search = search *(set_params) || Profile.all
    # .where("skills.name" => "skill1")

    @search = Profile.near(params[:location_address], 20).joins(:skills).where(skills: {:name => params[:skill_search]}).page(params[:page]).per(10)
    if params[:skill_search] == "" || params[:skill_search] == nil
      @search = Profile.all.page(params[:page]).per(10)
    end
    # @search = Profile.all.page(1).per(50)
    if user_signed_in?
      @search = @search.where.not(id: current_user.profile.id)
    end
    respond_with(@search)
  end


  private

    # def set_params
    #   lat    = params[:lan]    || current_user.profile.latitude
    #   log    = params[:log]    || current_user.profile.longitude
    #   within = params[:within] || 20
    #   skill  = params[:skill]  || nil

    #   return {skill: skill, lat: lat, log: log, within: within}
    # end

    def search(skill=nil, lat, log, within)
      if skill == nil
        search_list = Profile.near([lat, log], within, units: :km)
      else
        search_list = Profile.near([lat, log], within, units: :km).skills.where(name: skill)
      end
    end
end

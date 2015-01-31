class SearchController < ApplicationController

  respond_to :html, :json
  def index
    # lat    = params[:lan]    || current_user.profile.latitude
    # log    = params[:log]    || current_user.profile.longitude
    # within = params[:within] || 20
    # skill  = params[:skill]  || nil

    # @search = search *(set_params) || Profile.all
    @search = Profile.all.page(params[:page]).per(2)
    # @search = Profile.all.page(1).per(50)
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

######################--SCHEMA--###################
# t.string   "username",            limit: 255,   null: false
# t.string   "first_name",          limit: 255
# t.string   "last_name",           limit: 255
# t.text     "bio",                 limit: 65535
# t.string   "phone",               limit: 255
# t.date     "age"
# t.boolean  "gender",              limit: 1
# t.string   "university",          limit: 255
# t.string   "job_title",           limit: 255
# t.string   "Job_company",             limit: 255
# t.text     "job_details",         limit: 65535
# t.string   "address",             limit: 255
# t.float    "latitude",            limit: 24
# t.float    "longitude",           limit: 24
# t.integer  "rank",                limit: 4
# t.integer  "domain_id",           limit: 4
# t.integer  "user_id",             limit: 4
# t.string   "avatar",    limit: 255
####################################################
class ProfilesController < ApplicationController
  before_action :set_domains
  before_action :set_profile, only: [:edit_address ,:show, :edit, :update, :destroy, :add_skill]
  before_action :authenticate_user!, except: [:index, :show, :new, :create, :autocomplete_university_name, :locations]
  autocomplete  :university, :name
  respond_to    :html, :js

  def index
    @profiles = Profile.all.page(params[:page]).per(10)
    respond_with(@profiles)
  end

  def about
  end

  def show
    respond_with(@profile)
  end

  def new
    if user_signed_in?
      flash[:error] = "You cannot perform this action."
      redirect_to root_path
    else
      @profile = Profile.new
      @profile.build_user
      respond_with(@profile)
    end
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.save
    respond_with(@profile)
  end

  def update
    if profile_params[:languages].present?
      langs = (profile_params[:languages].split(",").map(&:to_i) + @profile.languages.map(&:id)) - (profile_params[:languages].split(",").map(&:to_i) & @profile.languages.map(&:id))
      
      langs.each do |l|
        lang = Language.find(l)
        @profile.languages << lang
      end
    end
    @profile.update(profile_params.except!(:languages))
    redirect_to :back
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  def add_skill
    unless params[:skill] == "" or params[:skill] == nil
      clear_flash
      if @profile.add_skill?(params[:skill])
        flash[:notice] = "Skill Added successfully"
      else
        flash[:error] = "Skill can't be added"
      end
      respond_to do |format|
        format.js
      end
    end
  end

  def edit_address
    render :address, :locals => {profile: @profile}
  end

  def locations
    render json: Profile.find(params[:id]).profile_locations
  end



  private


    def set_domains
      @domains = Domain.all.each { |c| c.ancestry = c.ancestry.to_s + (c.ancestry != nil ? "/" : '') + c.id.to_s
              }.sort {|x,y| x.ancestry <=> y.ancestry
              }.map{ |c| ["--" * (c.depth - 1) + c.name,c.id]
              }.unshift(["-- none --", nil])
    end

    def clear_flash
      flash.delete(:notice)
      flash.delete(:error)
    end

    def set_profile
      if params[:username]
        @profile = Profile.find_by_username(params[:username])
      # elsif params[:id]
      #   @profile = Profile.find(params[:id])
      elsif user_signed_in?
        @profile = current_user.profile
      end
    end

    # def address_params
    #   params.require(:profile).permit(:latitude, :longitude, :address)
    # end

    def profile_params
      params.require(:profile).permit(:languages, :github, :twitter, :linkedin,:facebook, :username, :first_name, :last_name,
       :job_title, :Job_company, :job_details, :bio, :phone, :gender, :address, :latitude, :longitude, :university, :age,
       :avatar, :domain_id, user_attributes: [:email, :password, :password_confirmation])
    end
end

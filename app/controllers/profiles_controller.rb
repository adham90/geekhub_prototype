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
# t.string   "Job_company",         limit: 255
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
  before_filter :valid_notice, except: [ :edit, :update ]
  before_filter :hide_navbar, only: [ :new ]

  before_action :set_domains
  before_action :set_profile, only: [:skills, :linked_accounts, :edit_address ,:show, :edit, :update, :destroy, :add_skill]
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
    if @profile
      respond_with(@profile)
    elsif params[:id]
      @profile = Profile.find_by_id(params[:id])
      if @profile
        respond_with(@profile)
      else
        redirect_to '/404'
      end
    elsif @profile == nil
      redirect_to '/404'
    end
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
    if @profile.save
      sign_in @profile.user
      redirect_to after_signup_path(:confirm_profile)
    else
      render :new
    end
  end

  def update
    @profile.update(profile_params)
    redirect_to :back
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end


  def edit_address
    render :address, :locals => {profile: @profile}
  end

  def locations
    render json: Profile.find(params[:id]).profile_locations
  end

  def linked_accounts
    render :linked_accounts, :locals => {profile: @profile}
  end

  def skills
    render :skills, :locals => {profile: @profile}
  end

  private

    def set_domains
      @domains = Domain.all
    end

    def set_profile
      if params[:username]
        @profile = Profile.find_by_username(params[:username])
      elsif user_signed_in?
        @profile = current_user.profile
      end
    end


    def profile_params
      params.require(:profile).permit(:github, :twitter, :linkedin,:facebook,
       :username, :first_name, :last_name,
       :job_title, :job_company, :job_details, :bio, :phone,
       :gender, :address, :latitude, :longitude, :university, :age,
       :avatar, :domain_id, user_attributes: [:email, :password, :password_confirmation],
       profile_skills_attributes: [:id, :skill_name, :experience_years, :description, :tags, :primary, :_destroy])
    end
end

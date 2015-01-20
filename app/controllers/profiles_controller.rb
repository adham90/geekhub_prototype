class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy, :add_skill]
  before_action :authenticate_user!, except: [:index, :show, :new]

  respond_to :html

  def index
    @profiles = Profile.all
    respond_with(@profiles)
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
    @profile.update(profile_params)
    respond_with(@profile)
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  def add_skill
    unless params[:skill] == "" or params[:skill] == nil
      if @profile.add_skill?(params[:skill])
        flash[:notice] = "Skill Added successfully"
      else
        flash[:error] = "Skill can't be added"
      end
    end
  end

  private
    def set_profile
      @profile = current_user.profile if user_signed_in?
    end

    def profile_params
      params.require(:profile).permit(:username, :name, :bit, :phone, 
        :rank, :gender, :address, 
        :latitude, :longitude, :age, :remote_avatar_url, user_attributes: [:email, :password, :password_confirmation])
    end
end

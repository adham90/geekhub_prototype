class ProfilesController < ApplicationController

  before_action :set_profile, only: [:show, :edit, :update, :destroy, :add_skill]
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
    @profile.update(profile_params)
    render :edit
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

  def locations
    render json: Profile.find(params[:id]).profile_locations
  end



  private
    def clear_flash
      flash.delete(:notice)
      flash.delete(:error)
    end

    def set_profile
      if params[:username]
        @profile = Profile.find_by_username(params[:username])
      elsif params[:id]
        @profile = Profile.find(params[:id])
      elsif user_signed_in?
        @profile = current_user.profile
      end
    end

    def profile_params
      params.require(:profile).permit(:username, :first_name, :last_name, :title, :bio, :phone, :gender, :address, :university, :age, :avatar, user_attributes: [:email, :password, :password_confirmation])
    end
end

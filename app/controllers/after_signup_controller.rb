class AfterSignupController < ApplicationController
  before_action :authenticate_user!
  include Wicked::Wizard

  steps :confirm_profile, :confirm_address, :confirm_skills#, :find_friends

  def show
    @user = current_user
    case step
    when :confirm_profile
      @profile = current_user.profile
    when :confirm_address
      @profile = current_user.profile
    when :confirm_skills
      @profile = current_user.profile
    # when :find_friends
    #   @profile = current_user.profile
    end
    render_wizard
  end

  def update
    current_user.profile.update(profile_params)
    render_wizard current_user.profile
  end


  private

    def finish_wizard_path
      flash[:notice] = "Thanks for signing up."
      root_path
    end

    def profile_params
     params.require(:profile).permit(:github, :twitter, :linkedin,:facebook,
      :username, :first_name, :last_name,
      :job_title, :Job_company, :job_details, :bio, :phone,
      :gender, :address, :latitude, :longitude, :university, :age,
      :avatar, :domain_id, user_attributes: [:email, :password, :password_confirmation],
      profile_skills_attributes: [:id, :skill_name, :experience_years, :description, :tags, :primary, :_destroy])
    end
end

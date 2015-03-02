class AfterSignupController < ApplicationController
  before_action :set_domains
  before_action :authenticate_user!
  include Wicked::Wizard

  steps :confirm_facebook, :confirm_profile

  def show
    @user = current_user
    unless @user.profile.present?
      @profile = current_user.build_profile
    else
      @profile = current_user.profile
    end
    case step
    when :confirm_facebook
      @profile.profile_skills.build
    end
    render_wizard
  end

  def update
    if profile_params.present? && current_user.profile.present?
      current_user.profile.status = step
      current_user.profile.status = 'active' if step == steps.last
      if current_user.profile.update(profile_params)
        flash[:notice] = "Update success."
        render_wizard current_user.profile
      else
        flash[:error] = "Update failed: #{ current_user.profile.errors.full_messages.to_sentence }"
        redirect_to :back
      end
    else
      current_user.build_profile
      current_user.profile.status = step
      current_user.profile.status = 'active' if step == steps.last
      if current_user.profile.update(profile_params)
        flash[:notice] = "Update success."
        render_wizard current_user.profile
      else
        flash[:error] = "Update failed: #{ current_user.profile.errors.full_messages.to_sentence }"
        redirect_to :back
      end
    end
  end


  private

    def set_domains
      @domains = Domain.all
    end


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
      profile_skills_attributes: [:id, :skill_name, :experience_years, :description, :primary, :_destroy])
    end
end

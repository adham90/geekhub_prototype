class AutocompletesController < ApplicationController
  respond_to :json

  def skill
    @skills = Skill.where("name LIKE ?", "%#{params[:q].downcase}%").limit(5).map do |copy|
      { id: copy.id,
        name: copy.name
      }
    end
    respond_with(@skills)
  end

  def university
    @university = Profile.where("university LIKE ?", "%#{params[:q]}%").limit(5).map do |copy|
      {
        name: copy.university
      }
    end
    respond_with(@university)
  end
end

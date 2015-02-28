class AutocompletesController < ApplicationController
  respond_to :json

  def skill
    @skills = Skill.where("lower(name) LIKE ?", "%#{params[:q].downcase}%").limit(5).map do |copy|
      { id: copy.id,
        name: copy.name
      }
    end
    respond_with(@skills)
  end

  def university
    @university = Profile.where("lower(university) LIKE ?", "%#{params[:q].downcase}%").limit(5).map do |copy|
      {
        name: copy.university
      }
    end
    respond_with(@university)
  end

  def title
    @title = Profile.where("lower(title) LIKE ?", "%#{params[:q].downcase}%").limit(5).map do |copy|
      {
        name: copy.title
      }
    end
    respond_with(@title)
  end

end

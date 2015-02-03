class AutocompletesController < ApplicationController
  respond_to :json

  def skill
    @skills = Skill.where("name LIKE ?", "%#{params[:term]}%").limit(5).map(&:name)
    respond_with(@skills)
  end
end

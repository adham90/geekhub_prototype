class PairsController < ApplicationController
  before_action :set_pair, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    @pairs = Pair.all
    respond_with(@pairs)
  end

  def show

  end

  def new
    @pair = Pair.new()
    @pair.driver_id = current_user.profile.id
    respond_to do |format|
      format.js { render "new.js.erb" }
    end
  end

  def edit
  end

  def create
    @pair = Pair.new(pair_params)
    @pair.driver_id = current_user.profile.id
    respond_to do |format|
      if @pair.save
        format.js { render "create.js.erb", notice: 'Pair request sended successfully.' } 
      else
        flash[:error] = @pair.errors.full_messages.to_sentence
        format.js { render "error.js.erb" }
      end
    end
  end

  def update
    pair_update_params[:last_updated_by] = current_user.id
    @pair.update(pair_update_params)
    respond_with(@pair)
  end

  def destroy
    @pair.update(
      cancelled_at = Datetime.now,
      cancelled = current_user.id
    )
    respond_with(@pair)
  end

  def set_status
    current_user.pairs.find(params[:pair_id]).update(
      confirmation_status = params[:confirmation_status]
    )
  end

  private
    def set_pair
      @pair = Pair.find(params[:id])
    end

    def pair_params
      params.require(:pair).permit(
        :navigator_id,
        :pair_date,
        :pair_time,
        :confirmation_status,
        :address,
        :address_details,
        :details,
        :type,
        :hangout_url
      )
    end

    def pair_update_params
      params.require(:pair).permit(
        :pair_date,
        :pair_time,
        :address,
        :address_details,
        :details,
        :type,
        :hangout_url
      )
    end
end

######################--SCHEMA--###################
# t.integer  "driver_id",                limit: 4,                     null: false
# t.integer  "navigator_id",             limit: 4,                     null: false
# t.datetime "pair_date",                                              null: false
# t.float    "pair_time",                limit: 24,                    null: false
# t.datetime "confirmed_at"
# t.boolean  "confirmation_status",      limit: 1
# t.float    "latitude",                 limit: 24
# t.float    "longitude",                limit: 24
# t.string   "address",                  limit: 255
# t.string   "address_details",          limit: 255
# t.text     "details",                  limit: 65535
# t.boolean  "type",                     limit: 1,     default: false
# t.string   "hangout_url",              limit: 255
# t.integer  "last_updated_by",          limit: 4
# t.boolean  "last_update_confirmation", limit: 1
# t.boolean  "cancelled",                limit: 1,     default: false
# t.boolean  "done",                     limit: 1,     default: false
#####################################################
require 'date'
class PairsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :new, :create, :destroy, :set_status]
  before_action :set_pair, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    @d_pair = current_user.profile.drives.where(done: false).order(updated_at: :asc)
    @n_pair = current_user.profile.navigats.where(done: false).order(updated_at: :asc)
  end

  def show
  end

  def new
    @pair = Pair.new(navigator_id: params[:navigator_id])
    @pair.driver_id = current_user.profile.id
    respond_to do |format|
      format.js { render "new.js.erb" }
    end
  end

  def navigator_edit
    @pair = current_user.profile.navigats.find(params[:pair_id])
    respond_to do |format|
      format.js { render "edit.js.erb" }
    end
  end

  def edit
    @pair = current_user.profile.drives.find(params[:id])
    respond_to do |format|
      format.js { render "edit.js.erb" }
    end
  end

  def create

    pair_params[:pair_date] =  DateTime.parse(pair_params[:pair_date])
    @pair = Pair.new(pair_params)
    @pair.driver_id = current_user.profile.id
    

    respond_to do |format|
      if @pair.save
        flash[:notice] = 'Pair request sended successfully.'
        format.js { render "create.js.erb" } 
      else
        flash[:error] = 'Please review the field hints below:'
        format.js { render "error.js.erb" }
      end
    end
  end

  def update
    pair_update_params[:last_updated_by] = current_user.id
    pair_update_params[:last_update_confirmation] = false
    @pair.update(pair_update_params)
    respond_to do |format|
      if @pair.save
        flash[:notice] = 'Pair request sended successfully.'
        format.js { render "edit.js.erb" } 
      else
        flash[:error] = 'Please review the field hints below:'
        format.js { render "error.js.erb" }
      end
    end
  end

  def destroy
    @pair.update(cancelled: true)
    redirect_to :back
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
        :driver_id,
        :navigator_id,
        :pair_date,
        :pair_time,
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

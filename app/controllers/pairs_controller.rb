class PairsController < ApplicationController
  before_action :set_pair, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @pairs = Pair.all
    respond_with(@pairs)
  end

  def show
    respond_with(@pair)
  end

  def new
    @pair = Pair.new
    respond_with(@pair)
  end

  def edit
  end

  def create
    @pair = Pair.new(pair_params)
    @pair.save
    respond_with(@pair)
  end

  def update
    @pair.update(pair_params)
    respond_with(@pair)
  end

  def destroy
    @pair.destroy
    respond_with(@pair)
  end

  private
    def set_pair
      @pair = Pair.find(params[:id])
    end

    def pair_params
      params[:pair]
    end
end

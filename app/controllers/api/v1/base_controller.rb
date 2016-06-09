class Api::V1::BaseController < ApplicationController
  respond_to :json

  def index
    respond_with model.all
  end

  def show
    respond_with model.find(params[:id])
  end

  def random
    respond_with model.order("RANDOM()").first
  end

  def find
    unless params_lower?
      respond_with model.find_by(permitted_params)
    else
      respond_with model.where("lower(#{key}) = ?", params[key].downcase).first
    end
  end

  def find_all
    unless params_lower?
      respond_with model.where(permitted_params)
    else
      respond_with model.where("lower(#{key}) = ?", params[key].downcase)
    end
  end

  private

    def key
      params.keys.first
    end

    def format_unit_price
      params[:unit_price] = params[:unit_price].split('.').join.to_i
    end
end

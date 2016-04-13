class Api::FinderController < Api::BaseController

  def show
    unless params_lower?
      respond_with model.find_by(permitted_params)
    else
      respond_with model.where("lower(#{key}) = ?", params[key].downcase).first
    end
  end

  def index
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

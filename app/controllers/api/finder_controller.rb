class Api::FinderController < Api::ApiController
  respond_to :json

  def index
    respond_with model.all
  end

  def show
    respond_with model.find(params[:id])
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
    def model
      params[:controller][/\/([a-z_]+)s\z/]
      model = $1.split("_").map {|m| m.capitalize}.join
      model.constantize
    end

    def key
      params.keys.first
    end
end

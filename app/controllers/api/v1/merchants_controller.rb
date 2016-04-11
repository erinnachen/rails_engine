class Api::V1::MerchantsController < Api::ApiController
  respond_to :json
  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    key = params.keys.first
    value = params[key]
    if params_type == "integer"
      respond_with Merchant.where("#{key}"=> value.to_i).take
    elsif params_type == "time"
      respond_with Merchant.where("#{key}"=> value).take
    elsif params_type == "string"
      respond_with Merchant.where("lower(#{key}) = ?", value.downcase).take
    end
  end

  def find_all
    key = params.keys.first
    value = params[key]
    if params_type == "integer"
      respond_with Merchant.where("#{key}"=> value.to_i)
    elsif params_type == "time"
      respond_with Merchant.where("#{key}"=> value)
    elsif params_type == "string"
      respond_with Merchant.where("lower(#{key}) = ?", value.downcase)
    end
  end

  private
    def params_map
      {"id" => "integer", "created_at" => "time", "updated_at" => "time", "name" => "string"}
    end

    def params_type
      params_map[params.keys.first]
    end

end

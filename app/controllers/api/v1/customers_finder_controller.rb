class Api::V1::CustomersFinderController < Api::ApiController
  respond_to :json
  def find
    key = params.keys.first
    value = params[key]
    if params_type == "integer"
      respond_with Customer.where("#{key}"=> value.to_i).first
    elsif params_type == "time"
      respond_with Customer.where("#{key}"=> value).first
    elsif params_type == "string"
      respond_with Customer.where("lower(#{key}) = ?", value.downcase).first
    end
  end

  def find_all
    key = params.keys.first
    value = params[key]
    if params_type == "integer"
      respond_with Customer.where("#{key}"=> value.to_i)
    elsif params_type == "time"
      respond_with Customer.where("#{key}"=> value)
    elsif params_type == "string"
      respond_with Customer.where("lower(#{key}) = ?", value.downcase)
    end
  end

  private

    def params_map
      {"id" => "integer", "created_at" => "time", "updated_at" => "time", "first_name" => "string", "last_name" => "string"}
    end

    def params_type
      params_map[params.keys.first]
    end
end

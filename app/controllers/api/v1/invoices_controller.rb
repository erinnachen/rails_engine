class Api::V1::InvoicesController < Api::ApiController
  respond_to :json

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find(params[:id])
  end

  def find
    key = params.keys.first
    value = params[key]
    if params_type == "integer"
      respond_with Invoice.where("#{key}"=> value.to_i).first
    elsif params_type == "time"
      respond_with Invoice.where("#{key}"=> value).first
    elsif params_type == "string"
      respond_with Invoice.where("lower(#{key}) = ?", value.downcase).first
    end
  end

  private
    def params_map
      {"id" => "integer", "merchant_id" => "integer","customer_id" => "integer", "status" => "string", "created_at" => "time", "updated_at" => "time"}
    end

    def params_type
      params_map[params.keys.first]
    end
end

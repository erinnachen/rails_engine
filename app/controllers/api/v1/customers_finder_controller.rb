class Api::V1::CustomersFinderController < Api::ApiController
  respond_to :json
  def find
    unless params_lower?
      respond_with Customer.find_by(customer_params)
    else
      key = params.keys.first
      respond_with Customer.where("lower(#{key}) = ?", params[key].downcase).first
    end
  end

  def find_all
    unless params_lower?
      respond_with Customer.where(customer_params)
    else
      key = params.keys.first
      respond_with Customer.where("lower(#{key}) = ?", params[key].downcase)
    end
  end

  private

    def customer_params
      params.permit(:id, :created_at, :updated_at)
    end

    def params_lower?
      !!params[:first_name] || params[:last_name]
    end
end

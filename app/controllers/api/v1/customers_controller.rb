class Api::V1::CustomersController < Api::V1::BaseController
  def invoices
    respond_with Customer.find(params[:id]).invoices
  end

  def transactions
    respond_with Customer.find(params[:id]).transactions
  end

  def favorite_merchant
    respond_with Customer.find(params[:id]).favorite_merchant
  end

  private

    def model
      Customer
    end

    def permitted_params
      params.permit(:id, :created_at, :updated_at)
    end

    def params_lower?
      !!params[:first_name] || params[:last_name]
    end
end

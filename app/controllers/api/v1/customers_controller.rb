class Api::V1::CustomersController < Api::ModelController
  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find(params[:id])
  end

  def invoices
    respond_with Customer.find(params[:id]).invoices
  end

  def transactions
    respond_with Customer.find(params[:id]).transactions
  end

  def favorite_merchant
    respond_with Customer.find(params[:id]).favorite_merchant
  end
end

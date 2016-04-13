class Api::V1::CustomersTransactionsController < Api::ModelController
  def index
    respond_with Customer.find(params[:id]).transactions
  end
end

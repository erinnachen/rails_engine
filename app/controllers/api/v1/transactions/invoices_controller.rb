class Api::V1::Transactions::InvoicesController < Api::ApiController
  respond_to :json
  def show
    respond_with Transaction.find(params[:id]).invoice
  end
end

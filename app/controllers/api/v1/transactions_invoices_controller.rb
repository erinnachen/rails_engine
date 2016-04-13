class Api::V1::TransactionsInvoicesController < Api::BaseController
  def show
    respond_with Transaction.find(params[:id]).invoice
  end
end

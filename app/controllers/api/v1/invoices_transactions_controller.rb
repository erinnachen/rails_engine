class Api::V1::InvoicesTransactionsController < Api::BaseController
  def index
    respond_with Invoice.find(params[:id]).transactions
  end
end

class Api::V1::CustomersInvoicesController < Api::BaseController
  def index
    respond_with Customer.find(params[:id]).invoices
  end
end

class Api::V1::InvoicesInvoiceItemsController < Api::BaseController
  def index
    respond_with Invoice.find(params[:id]).invoice_items
  end
end

class Api::V1::InvoiceItemsInvoicesController < Api::BaseController
  def show
    respond_with InvoiceItem.find(params[:id]).invoice
  end
end

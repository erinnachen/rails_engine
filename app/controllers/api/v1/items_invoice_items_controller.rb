class Api::V1::ItemsInvoiceItemsController < Api::BaseController
  def index
    respond_with Item.find(params[:id]).invoice_items
  end
end

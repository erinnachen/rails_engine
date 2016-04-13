class Api::V1::InvoiceItemsItemsController < Api::BaseController
  def show
    respond_with InvoiceItem.find(params[:id]).item
  end
end

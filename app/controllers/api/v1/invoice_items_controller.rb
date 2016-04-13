class Api::V1::InvoiceItemsController < Api::ModelController
  def invoice
    respond_with InvoiceItem.find(params[:id]).invoice
  end

  def item
    respond_with InvoiceItem.find(params[:id]).item
  end

  private
    def model
      InvoiceItem
    end
end

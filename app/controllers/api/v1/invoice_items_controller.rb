class Api::V1::InvoiceItemsController < Api::ModelController
  def item
    respond_with InvoiceItem.find(params[:id]).item
  end

  def invoice
    respond_with InvoiceItem.find(params[:id]).invoice
  end

  private

    def model
      InvoiceItem
    end
end

class Api::V1::InvoiceItemsController < Api::FinderController
  def invoice
    respond_with InvoiceItem.find(params[:id]).invoice
  end

  def item
    respond_with InvoiceItem.find(params[:id]).item
  end

  private
    def params_lower?
    end

    def permitted_params
      params.permit(:id, :invoice_id, :item_id, :quantity, :unit_price,  :created_at, :updated_at)
    end
end

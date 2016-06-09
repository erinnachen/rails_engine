class Api::V1::InvoiceItemsController < Api::V1::BaseController
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

    def permitted_params
      format_unit_price if params[:unit_price]
      params.permit(:id, :invoice_id, :item_id, :quantity, :unit_price,  :created_at, :updated_at)
    end

    def params_lower?
    end
end

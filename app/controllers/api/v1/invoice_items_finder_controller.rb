class Api::V1::InvoiceItemsFinderController < Api::FinderController

  private
    def permitted_params
      format_unit_price if params[:unit_price]
      params.permit(:id, :invoice_id, :item_id, :quantity, :unit_price,  :created_at, :updated_at)
    end

    def params_lower?
    end

    def model
      InvoiceItem
    end
end

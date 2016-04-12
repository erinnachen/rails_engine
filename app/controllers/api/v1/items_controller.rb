class Api::V1::ItemsController < Api::FinderController
  def invoice_items
    respond_with Item.find(params[:id]).invoice_items
  end

  def merchant
    respond_with Item.find(params[:id]).merchant
  end

  private
    def params_lower?
      !!params[:name] || !!params[:description]
    end

    def permitted_params
      params.permit(:id, :unit_price, :merchant_id, :created_at, :updated_at)
    end
end

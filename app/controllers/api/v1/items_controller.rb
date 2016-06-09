class Api::V1::ItemsController < Api::V1::BaseController
  def most_items
    respond_with Item.most_items(params[:quantity].to_i)
  end

  def most_revenue
    respond_with Item.most_revenue(params[:quantity].to_i)
  end

  def invoice_items
    respond_with Item.find(params[:id]).invoice_items
  end

  def merchant
    respond_with Item.find(params[:id]).merchant
  end

  def best_day
    respond_with Item.find(params[:id]).best_day, serializer: BestDaySerializer
  end

  private

    def model
      Item
    end

    def permitted_params
      format_unit_price if params[:unit_price]
      params.permit(:id, :unit_price, :merchant_id, :created_at, :updated_at)
    end

    def params_lower?
      !!params[:name] || !!params[:description]
    end
end

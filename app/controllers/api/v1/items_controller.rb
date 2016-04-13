class Api::V1::ItemsController < Api::FinderController
  def invoice_items
    respond_with Item.find(params[:id]).invoice_items
  end

  def merchant
    respond_with Item.find(params[:id]).merchant
  end

  def find
    unless params_lower?
      respond_with Item.find_by(permitted_params)
    else
      respond_with Item.where("lower(#{key}) = ?", params[key].downcase).first
    end
  end

  def best_day
    respond_with Item.find(params[:id]).best_day
  end

  private
    def params_lower?
      !!params[:name] || !!params[:description]
    end

    def permitted_params
      format_unit_price if params[:unit_price]
      params.permit(:id, :unit_price, :merchant_id, :created_at, :updated_at)
    end

end

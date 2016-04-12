class Api::V1::ItemsController < Api::FinderController
  private
    def params_lower?
      !!params[:name] || !!params[:description]
    end

    def permitted_params
      params.permit(:id, :unit_price, :merchant_id, :created_at, :updated_at)
    end
end

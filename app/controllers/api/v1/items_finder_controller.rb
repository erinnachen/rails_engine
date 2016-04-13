class Api::V1::ItemsFinderController < Api::FinderController

  private

    def permitted_params
      format_unit_price if params[:unit_price]
      params.permit(:id, :unit_price, :merchant_id, :created_at, :updated_at)
    end

    def params_lower?
      !!params[:name] || !!params[:description]
    end

    def model
      Item
    end
end

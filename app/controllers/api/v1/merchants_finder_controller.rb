class Api::V1::MerchantsFinderController < Api::FinderController
  private
    def permitted_params
      params.permit(:id, :created_at, :updated_at)
    end

    def params_lower?
      !!params[:name]
    end

    def model
      Merchant
    end
end

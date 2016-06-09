class Api::V1::InvoicesFinderController < Api::FinderController

  private

    def permitted_params
      params.permit(:id, :merchant_id, :customer_id, :updated_at, :created_at)
    end

    def params_lower?
      !!params[:status]
    end

    def model
      Invoice
    end
end

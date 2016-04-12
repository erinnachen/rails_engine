class Api::V1::TransactionsController < Api::FinderController
  respond_to :json

  private
    def permitted_params
      params.permit(:id, :invoice_id, :credit_card_number, :created_at, :updated_at)
    end

    def params_lower?
      !!params[:result]
    end

end

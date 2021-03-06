class Api::V1::TransactionsController < Api::V1::BaseController
  def invoice
    respond_with Transaction.find(params[:id]).invoice
  end

  private

    def model
      Transaction
    end

    def permitted_params
      params.permit(:id, :invoice_id, :credit_card_number, :created_at, :updated_at)
    end

    def params_lower?
      !!params[:result]
    end
end

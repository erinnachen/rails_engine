class Api::V1::TransactionsController < Api::ModelController
  def invoice
    respond_with Transaction.find(params[:id]).invoice
  end

  private
    def model
      Transaction
    end

end

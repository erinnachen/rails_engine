class Api::V1::InvoicesController < Api::V1::BaseController
  def transactions
    respond_with Invoice.find(params[:id]).transactions
  end

  def invoice_items
    respond_with Invoice.find(params[:id]).invoice_items
  end

  def items
    respond_with Invoice.find(params[:id]).items
  end

  def customer
    respond_with Invoice.find(params[:id]).customer
  end

  def merchant
    respond_with Invoice.find(params[:id]).merchant
  end

  private

    def model
      Invoice
    end

    def permitted_params
      params.permit(:id, :merchant_id, :customer_id, :updated_at, :created_at)
    end

    def params_lower?
      !!params[:status]
    end
end

class Api::V1::InvoicesController < Api::ModelController
  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find(params[:id])
  end

  def find
    unless params_lower?
      respond_with Invoice.find_by(invoice_params)
    else
      key = params.keys.first
      respond_with Invoice.where("lower(#{key}) = ?", params[key].downcase).first
    end
  end

  def find_all
    unless params_lower?
      respond_with Invoice.where(invoice_params)
    else
      key = params.keys.first
      respond_with Invoice.where("lower(#{key}) = ?", params[key].downcase)
    end
  end

  def random
    respond_with Invoice.take
  end

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
    def invoice_params
      params.permit(:id, :merchant_id, :customer_id, :updated_at, :created_at)
    end

    def params_lower?
      !!params[:status]
    end
end

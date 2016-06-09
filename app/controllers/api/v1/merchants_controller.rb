class Api::V1::MerchantsController < Api::V1::BaseController
  def most_revenue
    respond_with Merchant.most_revenue(params[:quantity].to_i)
  end

  def total_revenue
    respond_with Merchant.revenue(params[:date]), serializer: TotalRevenueSerializer
  end

  def most_items
    respond_with Merchant.most_items(params[:quantity].to_i)
  end

  def items
    respond_with Merchant.find(params[:id]).items
  end

  def invoices
    respond_with Merchant.find(params[:id]).invoices
  end

  def revenue
    respond_with Merchant.find(params[:id]).revenue(params[:date]), serializer: RevenueSerializer
  end

  def favorite_customer
    respond_with Merchant.find(params[:id]).favorite_customer
  end

  def pending_invoice_customers
    respond_with Merchant.find(params[:id]).customers_with_pending_invoices
  end

  private

    def model
      Merchant
    end

    def permitted_params
      params.permit(:id, :created_at, :updated_at)
    end

    def params_lower?
      !!params[:name]
    end
end

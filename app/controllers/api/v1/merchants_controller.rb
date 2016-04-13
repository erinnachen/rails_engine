class Api::V1::MerchantsController < Api::ModelController
  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    unless params_lower?
      respond_with Merchant.find_by(merchant_params)
    else
      key = params.keys.first
      respond_with Merchant.where("lower(#{key}) = ?", params[key].downcase).first
    end
  end

  def find_all
    unless params_lower?
      respond_with Merchant.where(merchant_params)
    else
      key = params.keys.first
      respond_with Merchant.where("lower(#{key}) = ?", params[key].downcase)
    end
  end

  def random
    respond_with Merchant.take
  end

  def items
    respond_with Merchant.find(params[:id]).items
  end

  def invoices
    respond_with Merchant.find(params[:id]).invoices
  end

  def customers_with_pending_invoices
    respond_with Merchant.find(params[:id]).customers_with_pending_invoices
  end

  def favorite_customer
    respond_with Merchant.find(params[:id]).favorite_customer
  end

  def revenue
    respond_with Merchant.find(params[:id]).revenue(params[:date]), serializer: RevenueSerializer
  end

  def total_revenue
    respond_with Merchant.revenue(params[:date]), serializer: TotalRevenueSerializer
  end

  def most_revenue
    respond_with Merchant.most_revenue(params[:quantity].to_i)
  end

  def most_items
    respond_with Merchant.most_items(params[:quantity].to_i)
  end

  private
    def merchant_params
      params.permit(:id, :created_at, :updated_at)
    end

    def params_lower?
      !!params[:name]
    end

end

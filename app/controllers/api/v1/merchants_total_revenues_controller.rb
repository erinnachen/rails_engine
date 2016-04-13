class Api::V1::MerchantsTotalRevenuesController < Api::BaseController
  def show
    respond_with Merchant.revenue(params[:date]), serializer: TotalRevenueSerializer
  end
end

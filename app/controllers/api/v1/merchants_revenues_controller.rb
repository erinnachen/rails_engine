class Api::V1::MerchantsRevenuesController < Api::BaseController
  def show
    respond_with Merchant.find(params[:id]).revenue(params[:date]), serializer: RevenueSerializer
  end
end

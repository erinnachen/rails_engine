class Api::V1::MerchantsMostRevenuesController < Api::BaseController
  def index
    respond_with Merchant.most_revenue(params[:quantity].to_i)
  end
end

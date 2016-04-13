class Api::V1::MerchantsMostItemsController < Api::BaseController
  def index
    respond_with Merchant.most_items(params[:quantity].to_i)
  end
end

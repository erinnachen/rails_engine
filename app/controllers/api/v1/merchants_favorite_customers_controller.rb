class Api::V1::MerchantsFavoriteCustomersController < Api::BaseController
  def show
    respond_with Merchant.find(params[:id]).favorite_customer
  end
end

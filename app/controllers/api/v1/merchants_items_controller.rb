class Api::V1::MerchantsItemsController < Api::BaseController
  def index
    respond_with Merchant.find(params[:id]).items
  end
end

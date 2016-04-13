class Api::V1::MerchantsInvoicesController < Api::BaseController
  def index
    respond_with Merchant.find(params[:id]).invoices
  end
end

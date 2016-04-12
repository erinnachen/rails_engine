class Api::V1::Merchants::InvoicesController < Api::ApiController
  respond_to :json
  def index
    respond_with Merchant.find(params[:id]).invoices
  end
end

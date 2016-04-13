class Api::V1::InvoicesMerchantsController < Api::BaseController
  def show
    respond_with Invoice.find(params[:id]).merchant
  end
end

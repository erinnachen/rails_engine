class Api::V1::InvoicesItemsController < Api::BaseController
  def index
    respond_with Invoice.find(params[:id]).items
  end
end

class Api::V1::InvoicesCustomersController < Api::BaseController
  def show
    respond_with Invoice.find(params[:id]).customer
  end
end

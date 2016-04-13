class Api::V1::ItemsMerchantsController < Api::BaseController
  def show
    respond_with Item.find(params[:id]).merchant
  end
end

class Api::V1::ItemsMostItemsController < Api::BaseController
  def index
    respond_with Item.most_items(params[:quantity].to_i)
  end
end

class Api::V1::ItemsMostRevenuesController < Api::BaseController
  def show
    respond_with Item.most_revenue(params[:quantity].to_i)
  end
end

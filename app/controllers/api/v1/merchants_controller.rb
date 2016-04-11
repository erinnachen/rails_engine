class Api::V1::MerchantsController < Api::ApiController
  respond_to :json
  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    if params[:id]
      respond_with Merchant.find(params[:id].to_i)
    elsif params[:name]
      respond_with Merchant.where('lower(name) = ?', params[:name].downcase).take
    end
  end

end

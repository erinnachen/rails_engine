class Api::V1::MerchantsController < Api::ApiController
  respond_to :json
  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    unless params_lower?
      respond_with Merchant.find_by(merchant_params)
    else
      key = params.keys.first
      respond_with Merchant.where("lower(#{key}) = ?", params[key].downcase).first
    end
  end

  def find_all
    unless params_lower?
      respond_with Merchant.where(merchant_params)
    else
      key = params.keys.first
      respond_with Merchant.where("lower(#{key}) = ?", params[key].downcase)
    end
  end

  def random
    respond_with Merchant.take
  end

  private
    def merchant_params
      params.permit(:id, :created_at, :updated_at)
    end

    def params_lower?
      !!params[:name]
    end

end

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
    elsif params[:created_at]
      respond_with Merchant.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Merchant.find_by(updated_at: params[:updated_at])
    elsif params[:name]
      respond_with Merchant.where('lower(name) = ?', params[:name].downcase).take
    end
  end

  def find_all
    if params[:id]
      respond_with Merchant.where(id: params[:id].to_i)
    elsif params[:created_at]
      respond_with Merchant.where(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Merchant.where(updated_at: params[:updated_at])
    elsif params[:name]
      respond_with Merchant.where('lower(name) = ?', params[:name].downcase)
    end
  end

end

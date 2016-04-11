class Api::V1::CustomersFinderController < Api::ApiController
  respond_to :json
  def find
    if params[:id]
      respond_with Customer.find(params[:id].to_i)
    elsif params[:created_at]
      respond_with Customer.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Customer.find_by(updated_at: params[:updated_at])
    elsif params[:first_name]
      respond_with Customer.where('lower(first_name) = ?', params[:first_name].downcase).take
    elsif params[:last_name]
      respond_with Customer.where('lower(last_name) = ?', params[:last_name].downcase).take
    end
  end

  def find_all
    if params[:id]
      respond_with Customer.where(id: params[:id].to_i)
    elsif params[:created_at]
      respond_with Customer.where(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Customer.where(updated_at: params[:updated_at])
    elsif params[:first_name]
      respond_with Customer.where('lower(first_name) = ?', params[:first_name].downcase)
    elsif params[:last_name]
      respond_with Customer.where('lower(last_name) = ?', params[:last_name].downcase)
    end
  end
end

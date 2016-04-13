class Api::V1::CustomersFinderController < Api::FinderController
  def random
    respond_with Customer.take
  end

  private

    def permitted_params
      params.permit(:id, :created_at, :updated_at)
    end

    def params_lower?
      !!params[:first_name] || params[:last_name]
    end

    def model
      Customer
    end
end

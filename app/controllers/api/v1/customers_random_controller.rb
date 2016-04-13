class Api::V1::CustomersRandomController < Api::RandomController
  private
    def model
      Customer
    end
end

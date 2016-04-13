class Api::V1::MerchantsRandomController < Api::RandomController
  private
    def model
      Merchant
    end
end

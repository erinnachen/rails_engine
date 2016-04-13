class Api::V1::InvoicesRandomController < Api::RandomController
  private
    def model
      Invoice
    end
end

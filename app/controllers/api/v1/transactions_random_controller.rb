class Api::V1::TransactionsRandomController < Api::RandomController
  private
    def model
      Transaction
    end
end

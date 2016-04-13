class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  validates :first_name, presence: true
  validates :last_name, presence: true

  # def transactions
  #   Transaction.joins(:invoice).where(invoices: {customer_id: id})
  # end

  def success_transactions_count(merchant_id)
    transactions.where(result: "success", invoices: {merchant_id: merchant_id}).count
  end

end

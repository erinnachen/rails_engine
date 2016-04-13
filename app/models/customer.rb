class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  validates :first_name, presence: true
  validates :last_name, presence: true

  def success_transactions_count(merchant_id)
    transactions.where(result: "success", invoices: {merchant_id: merchant_id}).count
  end

  

  def favorite_merchant
    merchants.max_by { |merchant| success_transactions_count(merchant.id) }
  end

end

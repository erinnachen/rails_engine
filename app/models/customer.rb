class Customer < ActiveRecord::Base
  has_many :invoices

  validates :first_name, presence: true
  validates :last_name, presence: true

  def transactions
    Transaction.joins(:invoice).where(invoices: {customer_id: id})
  end
end

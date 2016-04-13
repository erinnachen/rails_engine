class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  validates :merchant_id, presence: true
  validates :customer_id, presence: true
  validates :status, presence: true

  def revenue
    self.joins(:transactions, :invoice_items).where(id: id, transactions: { result: "success" }).sum('invoice_items.quantity*invoice_items.unit_price')
  end

  def pending?
    !transactions.all? {|txn| txn.result == "success"}
  end

  def successful?
    !!transactions.find {|txn| txn.result == "success"}
  end
end

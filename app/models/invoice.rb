class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  validates :merchant_id, presence: true
  validates :customer_id, presence: true
  validates :status, presence: true

  def successful?
    transactions.where(result: "success").count > 0
  end

  def revenue
    return 0 unless successful?
    invoice_items.reduce(0) {|acc, inv_item| acc+inv_item.total}
  end
end

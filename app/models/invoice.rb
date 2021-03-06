class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  validates :merchant_id, presence: true
  validates :customer_id, presence: true
  validates :status, presence: true

  scope :paid, -> { joins(:transactions).where(transactions: { result: "success" })}
  scope :pending, -> { joins(:transactions).where(transactions: { result: "failed" })}
end

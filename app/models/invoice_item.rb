class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  validates :quantity, presence: true
  validates :unit_price, presence: true

  scope :paid, -> { joins(:transactions).where(transactions: { result: "success" })}
end

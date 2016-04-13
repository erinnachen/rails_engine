class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  validates :merchant_id, presence: true

  def best_day
    invoices.joins(:transactions).where(transactions: {result: "success"}).select("invoices.created_at, sum(invoice_items.quantity) as items_sold").group("invoices.created_at").order("items_sold DESC").take
  end

  def self.most_items(quantity)
    self.select("items.*, sum(invoice_items.quantity) as items_sold").joins(invoices: :transactions).where(transactions: {result: "success"}).group("items.id").order("items_sold DESC").take(quantity)
  end
end

class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  validates :merchant_id, presence: true

  def best_day
    #invoices.joins(:transactions).where(transactions: {result: "success"}).select("invoices.created_at, sum(invoice_items.quantity) as items_sold").group("invoices.created_at").order("items_sold DESC").take

    invoices.paid.select("invoices.created_at, sum(invoice_items.quantity) as items_sold").group("invoices.created_at").order("items_sold DESC").first
  end

  def self.most_items(quantity)
    # self.select("items.*, sum(invoice_items.quantity) as items_sold").joins(invoices: :transactions).where(transactions: {result: "success"}).group("items.id").order("items_sold DESC").take(quantity)
    #all.sort_by {|item| -1*item.total_sold }.first(quantity)
  end

  def self.most_revenue(quantity)
    #all.sort_by {|item| -1*item.total_revenue }.first(quantity)
  end

  def total_revenue
    invoice_items.reduce(0) do |sum, inv_item|
      if inv_item.invoice.successful?
        sum+inv_item.unit_price*inv_item.quantity
      else
        sum
      end
    end
  end

  def total_sold
    invoice_items.reduce(0) do |sum, inv_item|
      if inv_item.invoice.successful?
        sum+inv_item.quantity
      else
        sum
      end
    end
  end
end

class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  validates :name, presence: true

  def customers_with_pending_invoices
    customers = []
    invoices.each do |invoice|
      customers << Customer.find(invoice.customer_id) if invoice.pending?
    end
    customers.uniq
  end

  def favorite_customer
    customers.select("customers.*,
                      count(invoices.customer_id) as transactions_count")
             .joins(:invoices).joins(:transactions)
             .where(transactions: {result: "success"})
             .group("customers.id").order("transactions_count DESC").take
  end

  def revenue(date = nil)
    unless date
      invoices.joins(:transactions, :invoice_items).where(transactions: { result: "success" }).sum('invoice_items.quantity*invoice_items.unit_price')
    else
      invoices.joins(:transactions, :invoice_items).where(created_at: date, transactions: { result: "success" }).sum('invoice_items.quantity*invoice_items.unit_price')
    end
  end

  def self.most_revenue(quantity)
    #.order("revenue DESC").take(quantity)
    #self.select("merchants.*, sum('invoice_items.quantity*invoice_items.price') as revenue").joins(:transactions, :invoice_items).where(transactions: { result: "success" }).group("merchants.id").order("revenue DESC").take(quantity)
    all.sort_by {|merchant| -1*merchant.revenue }.first(quantity)
  end

  def self.revenue(date)
    Invoice.where(created_at: date).joins(:transactions, :invoice_items).where(transactions: { result: "success" }).sum('invoice_items.quantity*invoice_items.unit_price')
  end

  def self.most_items(quantity)
    # Merchant.select("merchants.*, sum(invoice_items.quantity) as items_count").joins(:transactions, :invoice_items).where(transactions: { result: "success" }).group("merchants.id").order("items_count DESC").take(quantity)
    all.sort_by {|merchant| -1*merchant.items_sold }.first(quantity)
  end

  def items_sold
    invoice_items.reduce(0) do |sum, inv_item|
      if inv_item.invoice.successful?
        sum+inv_item.quantity
      else
        sum
      end
    end
  end
end

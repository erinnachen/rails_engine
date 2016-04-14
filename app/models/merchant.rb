class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  validates :name, presence: true

  scope :paid_invoices, -> { joins(:invoices, :transactions).where(transactions: { result: "success" })}

  def customers_with_pending_invoices
    customers.has_pending_invoices
  end

  def favorite_customer
    customers.select("customers.*,
                      count(invoices.customer_id) as transactions_count")
             .paid_invoices
             .group("customers.id")
             .order("transactions_count DESC")
             .first
  end

  def revenue(date = nil)
    unless date
      invoices.paid.joins(:invoice_items).sum('quantity*unit_price')
    else
      invoices.paid.where(created_at: date)
              .joins(:invoice_items).sum('quantity*unit_price')
    end
  end

  def self.most_revenue(quantity)
    #.order("revenue DESC").take(quantity)
    #self.select("merchants.*, sum('invoice_items.quantity*invoice_items.price') as revenue").joins(:transactions, :invoice_items).where(transactions: { result: "success" }).group("merchants.id").order("revenue DESC").take(quantity)
    #all.sort_by {|merchant| -1*merchant.revenue }.first(quantity)
    # self.select("merchants.*, sum('invoice_items.quantity*invoice_items.unit_price') as revenue")
    #     .paid_invoices
    #     .joins(:invoice_items)
    #     .group("merchants.id")
    #     .order("revenue DESC")
    #     .first(quantity)

    self.paid_invoices.joins(:invoice_items).group("merchants.id").sum('quantity*unit_price').first(quantity)
  end

  def self.revenue(date)
    Invoice.paid.where(created_at: date)
           .joins(:invoice_items)
           .sum('quantity*unit_price')
  end

  def self.most_items(quantity)
    # Merchant.select("merchants.*, sum(invoice_items.quantity) as items_count").joins(:transactions, :invoice_items).where(transactions: { result: "success" }).group("merchants.id").order("items_count DESC").take(quantity)
    #all.sort_by {|merchant| -1*merchant.items_sold }.first(quantity)
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

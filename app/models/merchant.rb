class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  validates :name, presence: true

  scope :paid_invoices, -> { joins(invoices: [:transactions]).where(transactions: { result: "success" })}

  def customers_with_pending_invoices
    customer_ids = invoices.pending.pluck(:customer_id)
    Customer.find(customer_ids)
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
    select("merchants.*, sum(quantity*unit_price) as revenue")
          .joins(invoices: [:transactions, :invoice_items])
          .where(transactions: {result: "success"})
          .group("merchants.id")
          .order("revenue DESC")
          .first(quantity)
  end

  def self.revenue(date)
    Invoice.paid.where(created_at: date)
           .joins(:invoice_items)
           .sum('quantity*unit_price')
  end

  def self.most_items(quantity)
    select("merchants.*, sum(quantity) as items_sold")
          .joins(invoices: [:transactions, :invoice_items])
          .where(transactions: { result: "success" })
          .group("merchants.id")
          .order("items_sold DESC")
          .first(quantity)
  end
end

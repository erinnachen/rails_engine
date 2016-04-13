class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices

  validates :name, presence: true

  def customers_with_pending_invoices
    customers = []
    invoices.each do |invoice|
      customers << Customer.find(invoice.customer_id) unless invoice.successful?
    end
    #customers.uniq
  end

  def favorite_customer
    #SELECT COUNT("transactions".*) FROM "transactions" INNER JOIN "invoices" ON "invoices"."id" = "transactions"."invoice_id" WHERE "invoices"."customer_id" = 25 AND "invoices"."merchant_id" = 80 and "transactions"."result"='success';
    customers.max_by { |customer| customer.success_transactions_count(id) }
  end

  def revenue(date = nil)
    unless date
      invoices.reduce(0) { |acc, invoice| acc + invoice.revenue }
    else
      invoices.where(created_at: date).reduce(0) { |acc, invoice| acc + invoice.revenue }
    end
  end

  def self.most_revenue(quantity)
    all.sort_by {|merchant| -1*merchant.revenue }.first(quantity)
  end

  def self.revenue(date)
    all.reduce(0) {|acc, merchant| acc+merchant.revenue(date)}
  end
end

class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices

  validates :name, presence: true

  # def customers_with_pending_invoices
  #   customers = []
  #   invoices.each do |invoice|
  #     customers << Customer.find(invoice.customer_id) unless invoice.successful?
  #   end
  #   #customers.uniq
  # end

  def favorite_customer
    #SELECT COUNT("transactions".*) FROM "transactions" INNER JOIN "invoices" ON "invoices"."id" = "transactions"."invoice_id" WHERE "invoices"."customer_id" = 25 AND "invoices"."merchant_id" = 80 and "transactions"."result"='success';
    customers.max_by { |customer| customer.success_transactions_count(id) }
  end
end

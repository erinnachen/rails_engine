class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  validates :first_name, presence: true
  validates :last_name, presence: true

  scope :paid_invoices, -> { joins(:transactions).where(transactions: { result: "success" })}

  def favorite_merchant
   merchants.select("merchants.*,
                     count(invoices.merchant_id) as transactions_count")
            .paid_invoices
            .group("merchants.id")
            .order("transactions_count DESC")
            .first
  end

end

class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant

  validates :merchant_id, presence: true
  validates :customer_id, presence: true
  validates :status, presence: true
end

class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :invoice_id, :quantity,
             :unit_price, :created_at, :updated_at

  def unit_price
   "#{format("%.2f", object.unit_price/100.0)}"
  end
end

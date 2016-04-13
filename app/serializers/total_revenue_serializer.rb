class TotalRevenueSerializer < ActiveModel::Serializer
  attributes :total_revenue
  def total_revenue
    "#{format("%.2f", object/100.0)}"
  end
end

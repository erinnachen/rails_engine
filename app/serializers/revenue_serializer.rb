class RevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    "#{format("%.2f", object/100.0)}"
  end
end

class Api::V1::ItemsController < Api::ModelController
  def most_items
    respond_with Item.most_items(params[:quantity].to_i)
  end

  def most_revenue
    respond_with Item.most_revenue(params[:quantity].to_i)
  end

  def invoice_items
    respond_with Item.find(params[:id]).invoice_items
  end

  def merchant
    respond_with Item.find(params[:id]).merchant
  end

  def best_day
    respond_with Item.find(params[:id]).best_day, serializer: BestDaySerializer
  end

  private

    def model
      Item
    end
end

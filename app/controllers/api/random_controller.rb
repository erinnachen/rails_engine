class Api::RandomController < Api::BaseController
  def show
    respond_with model.order("RANDOM()").first
  end
end

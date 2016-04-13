class Api::RandomController < Api::BaseController
  def show
    respond_with model.take
  end
end

class Api::ModelController < Api::BaseController
  def index
    respond_with model.all
  end

  def show
    respond_with model.find(params[:id])
  end


end

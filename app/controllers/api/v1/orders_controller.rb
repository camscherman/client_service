class Api::V1::OrdersController < Api::BaseController
  before_action :authenticate_api_user!
  def update
    # render json: order_params
    order = Order.find(params[:id])
    # byebug
    order.update({status: "shipped"})
    render json: {update: "success"}
  end
end

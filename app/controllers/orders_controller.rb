class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:update]
  def show
    user = current_user
    @order = Orders::MakeOrderService.new(params[:id], user)
    @order.calculateTotal
    # render json: {title: @order.title, price: @order.subtotal, pst: @order.pst}
  end

  def create
    user = current_user
    @order = Orders::MakeOrderService.new(order_params[:book_id], user)
    @order.calculateTotal
    @order.createOrder
    flash[:alert] = "Order Submitted"
    redirect_to root_path
  end

  def index
    user = current_user
    @orders = user.orders
  end

  def update
    # render json: order_params
    order = Order.find(params[:id])
    # byebug
    order.update({status: "shipped"})
    render json: {update: "success"}
  end

  private
  def order_params
    params.require(:order).permit(:book_id)
  end


end

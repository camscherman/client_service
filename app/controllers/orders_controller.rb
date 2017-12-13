class OrdersController < ApplicationController
  before_action :authenticate_user!
  def show
    user = current_user
    @order = Orders::MakeOrderService.new(params[:id], user)
    @order.calculateTotal
    # render json: {title: @order.title, price: @order.subtotal, pst: @order.pst}
  end

  def create
    user = current_user
    @order = Orders::MakeOrderService.new(params[:order][:book_id], user)
    @order.calculateTotal
    @order.createOrder
    flash[:alert] = "Order Submitted"
    redirect_to root_path
  end

  def index
    user = current_user
    @orders = user.orders
  end


end

class Front::OrdersController < ApplicationController
  def create
    order_params = params.require(:order).permit(:user_id, :product_id)
    order = Order.new(order_params)
    if order.save
      redirect_to pay_order_path(order)
    else
      redirect_to product_path(params[:product_id])
    end
  end

  def pay
    @order = Order.find(params[:id])
    @config = PaymentConfig.last
    @checkvalue = @order.checkvalue(@config)
  end


  def show
    @order = Order.find(params[:id])
  end
end

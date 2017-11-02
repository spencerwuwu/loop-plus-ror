class Front::OrdersController < ApplicationController
  def create
    order_params = params.require(:order).permit(:user_id, :product_id, :payment_type_id)
    order = Order.new(order_params)

      order.payment_price = order.product.price + order.payment_type.addon_fee
    if order.payment_type_id == 1
      order.income = order.product.price
    elsif order.payment_type_id == 2
      order.income = order.product.price
    else
      order.income = order.product.price * (1 - order.payment_fee)
    end

    if order.save
      redirect_to pay_order_path(order)
    else
      redirect_to product_path(params[:product_id])
    end
  end

  def pay
    @order = Order.find(params[:id])
    @config = PaymentConfig.last
    if current_user.common_email.present?
      @email = current_user.common_email
    else 
      @email = current_user.email
    end

    @raw = @order.get_raw(@order, @config, @email)
    @trade_info = @order.trade_info(@raw, @config)
    @trade_sha = @order.trade_sha(@trade_info, @config)

  end


  def show
    @order = Order.find(params[:id])
  end
end

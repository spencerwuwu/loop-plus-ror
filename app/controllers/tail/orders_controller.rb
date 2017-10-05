class Tail::OrdersController < ApplicationController
  layout 'tail'

  def index
    @orders = Order.all()
  end

  def show
    @order = Order.find(params[:id])
  end

end

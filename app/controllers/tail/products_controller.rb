class Tail::ProductsController < ApplicationController
  layout 'tail'

  def index
    @products = Product.all()
  end

  def show
    @product =  Product.find(params[:id])
  end

  def new
  end

end

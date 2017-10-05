class Tail::RefundsController < ApplicationController
  layout 'tail'

  def index
    @refunds = Refund.all()
  end

  def show
    @refund = Refund.find(params[:id])
  end
end

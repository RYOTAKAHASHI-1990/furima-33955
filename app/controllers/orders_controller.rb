class OrdersController < ApplicationController
  def new
  end
  
  def index
    @order_address = OrderAddress.new
  end

  def create
  end
end

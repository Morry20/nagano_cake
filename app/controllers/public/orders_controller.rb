class Public::OrdersController < ApplicationController

  def new
    @order = Order.new

  end

  def confirm
    #binding.pry
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.shipping_cost = 800
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:select_address] == 0
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == 1
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == 2
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    end
    
  end

  def complete
  end

  def create
  end

  def index
    @orders = current_customer.orders
  end

  def show
  end

  private
  def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end

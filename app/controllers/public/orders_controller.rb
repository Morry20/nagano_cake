class Public::OrdersController < ApplicationController

  def new
    @order = Order.new

  end

  def confirm
    @order = Order.new
    @cart_items = current_customer.cart_items
    @order.shipping_cost = 800
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:current_customer_address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    end
    # binding.pry
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    #@order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    item = []
    @cart_items.each do |i|
      item << @order.order_details.new(
        order_id: @order.id,
        item_id: i.item_id,
        price: i.item.price,
        amount: i.amount
        )

    end
    OrderDetail.import(item)
#カートの削除機能をつける
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @orders = current_customer.orders.page(params[:page]).reverse_order
  end

  def show
    @order =  Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
  end

end

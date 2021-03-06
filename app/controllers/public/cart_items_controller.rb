class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.customer_id = current_customer.id
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.customer_id = current_customer.id
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = CartItem.all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(item_id: cart_item_params[:item_id], amount: cart_item_params[:amount], customer_id: current_customer.id)
    @cart_item.save
    redirect_to cart_items_path
  end

  private
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :amount, :customer_id)
    end

end

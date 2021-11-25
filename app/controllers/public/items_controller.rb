class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private

    def items_params
      params.require(:item).permit(:name, :image, :introduction, :price, :is_active, :genre_id)
    end

end

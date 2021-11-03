class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
  end
  
  private
  
    def items_params
      params.require(:item).permit(:name, :image, :introduction, :price, :is_active, :genre_id)
    end
  
end

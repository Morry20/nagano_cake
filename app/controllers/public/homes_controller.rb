class Public::HomesController < ApplicationController

  def top
    @genres = Genre.all
    @items = Item.page(params[:page]).reverse_order
    @items_count = Item.count
  end

  def about
  end



end

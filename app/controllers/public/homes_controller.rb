class Public::HomesController < ApplicationController
  
  def top
    @genres = Genre.all
    @items = Item.all
    @items_count = Item.count
  end
  
  def about
  end
  
  
  
end

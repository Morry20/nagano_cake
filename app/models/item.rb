class Item < ApplicationRecord

   belongs_to :genre

   has_many :order_details, dependent: :destroy
   has_many :cart_items, dependent: :destroy

   attachment :image

   enum is_active: {"販売中": true,"販売停止中": false}

   def with_tax_price
    (price * 1.1).floor
   end

end

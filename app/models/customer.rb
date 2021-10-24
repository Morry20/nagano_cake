class Customer < ApplicationRecord
   enum is_deleted: { "有効": true, "退会": false }
   
   has_many :orders, dependent: :destroy
end

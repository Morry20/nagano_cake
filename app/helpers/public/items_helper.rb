module Public::ItemsHelper

  def converting_to_jpy(price)
    price = (price * 1.1).floor
    "¥#{price.to_s(:delimited, delimiter: ',')}"
  end

end

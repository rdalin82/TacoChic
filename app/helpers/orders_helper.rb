module OrdersHelper
  def total(order)
    order.inject(0) { |sum, item| sum + item.item.price }
  end
  def tax(order)
    total = total(order)
    return total * 0.1025
  end
  
  def price_of_order(order)
    "$" +  sprintf("%.2f", order)
  end
end

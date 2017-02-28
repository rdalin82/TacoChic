module ApplicationHelper
  def price_of(obj)
    "$" +  sprintf("%.2f", obj.price)
  end
end

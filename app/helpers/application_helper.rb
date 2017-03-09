module ApplicationHelper
  def price_of(obj)
    "$" +  sprintf("%.2f", obj.price)
  end
  def admin_only (&block)
    if current_user && current_user.admin
      block.call
    end
  end
end

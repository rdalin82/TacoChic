class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  before_action :item_count

  def authenticate_admin
    authenticate_user!
    unless current_user.admin
      redirect_to root_path, alert: "You must be an admin to do that."
    end
  end

  def item_count
    if current_user
      @item_count = current_user.orders.pending.last.order_items.count
    else
      @items_count = 0
    end
  end
  
end

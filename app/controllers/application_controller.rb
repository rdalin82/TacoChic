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
    @items_count = 0
    if current_user.try(:orders)
      if current_user.orders.pending.last
        @items_count = current_user.orders.pending.last.order_items.count
      end
    end
    @items_count
  end

end

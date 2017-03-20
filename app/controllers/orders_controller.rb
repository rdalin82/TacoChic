class OrdersController < ApplicationController
  before_action :set_user, :set_order

  def show
    @orders = @user.orders.last.order_items.includes(:item) || []
  end
  def add
    @user.orders.last.order_items << OrderItem.new(item: Item.find(params[:item_id]))
    if @user.orders.last.save
      flash.now[:notice] = "Item has been added"
    else
      flash.now[:warning] = "Item was not added"
    end
    head :no_content
  end

  def remove
    @user.orders.last.order_items.delete(OrderItem.find(params[:item_id]))
    if @user.orders.last.save
      flash.now[:notice] = "Item was removed"
      redirect_to :show_order
    else
      flash.now[:warning] = "Item was not removed"
      redirect_to :show_order
    end
  end

  private

  def order_params
    params.permit(:item_id)
  end
  def set_user
    if current_user
      @user = current_user
    else
      redirect_to  new_user_registration_path
    end
  end

  def set_order
    @user.orders.build if  @user.orders.pending == []
  end

end

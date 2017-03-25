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
      redirect_to :show_order
    else
      redirect_to :show_order
    end
  end

  def submit
    @last_order = @user.orders.last
    if OrderMailerJob.perform_now(current_user, @last_order.order_items) && @last_order.save
      @last_order.update(completed: true)
      flash.now[:notice] = "Order was submitted, please check your email"
      #delayed email job
      redirect_to :menus_orders_thanks
    else
      flash.now[:warning] = "Order cannot be submitted at this time"
      render :show
    end
  end

  def thanks
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

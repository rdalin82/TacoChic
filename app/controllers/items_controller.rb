class ItemsController < ApplicationController
  before_action :set_menu
  before_action :authenticate_admin, only: [:new, :create, :edit, :update, :destroy]

  def new
    @item = @menu.items.build
  end

  def create
    @item = @menu.items.build(item_params)
    if @item.save
      flash.now[:notice] = "New item was created"
      redirect_to [@menu, @item]
    else
      flash.now[:warning] = "New item was not created"
      render :new
    end
  end
  def show
    @item = @menu.items.find(params[:id])
  end

  def edit
    @item = @menu.items.find(params[:id])
  end
  def update
    @item = @menu.items.find(params[:id])
    if @item.update(item_params)
      flash.now[:notice] = "Item has been udpated"
      redirect_to menu_path(@menu)
    else
      flash.now["warning"] = "Item was not updated"
      render :edit
    end
  end
  def destroy
    @item = @menu.items.find(params[:id])
    @item.destroy
    redirect_to menu_path(@menu)
  end

  private
  def set_menu
    @menu = Menu.find(params[:menu_id])
  end
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :price)
  end
end

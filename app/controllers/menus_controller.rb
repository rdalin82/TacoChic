class MenusController < ApplicationController
  def index
    @menus = Menu.all.order(:start)
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.create(menu_params)
    if @menu.save
      flash[:notice] = "Menu created"
      redirect_to menus_path
    else
      flash.now[:alert] = "Menu not created"
      render :new
    end
  end
  def edit
    @menu = Menu.find(params[:id])
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      flash[:notice] = "Successfully updated"
      redirect_to menus_path
    else
      flash[:alert] = "Menu was not updated"
      render :edit
    end
  end

  def destroy
    Menu.find(params[:id]).delete
    flash[:notice] = "Menu has been deleted."
    redirect_to menus_path
  end

  private
  def menu_params
    params.require(:menu).permit(:meal, :start, :stop)
  end
end

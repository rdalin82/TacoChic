class CategoriesController < ApplicationController
  before_action :set_menu
  before_action :authenticate_admin, only: [:new, :create, :edit, :update, :destroy]

  def new
    @category = @menu.categories.build
  end
  def create
    @category = @menu.categories.build(category_params)
    if @category.save
      flash.now[:notice] = "successfully created"
      redirect_to [@menu, @category]
    else
      flash.now[:warning] = "unable to create new category"
      render :new
    end
  end
  def show
    @category = @menu.categories.find(params[:id])
  end
  def edit
    @category = @menu.categories.find(params[:id])
  end
  def update
    @category = @menu.categories.find(params[:id])
    if @category.update(category_params)
      flash.now[:notice] = "successfully updated"
      redirect_to [@menu, @category]
    else
      flash.now[:warning] = "unable to update categories"
      render :edit
    end
  end
  def destroy
    @category.find(params[:id])
    @category.delete
    redirect_to menu_path(@menu)
  end
  private
  def category_params
    params.require(:category).permit(:name)
  end
  def set_menu
    @menu = Menu.find(params[:menu_id])
  end

end

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.create(category_params)
    if @category.save
      flash.now[:notice] = "successfully created"
      redirect_to categories_path
    else
      flash.now[:warning] = "unable to create new cateogry"
      render :new
    end
  end
  def show
    @category = Category.find(params[:id])
  end
  def edit
    @category = Category.find(params[:id])
  end
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash.now[:notice] = "successfully updated"
      redirect_to categories_path
    else
      flash.now[:warning] = "unable to update categories"
      render :edit
    end
  end
  def destroy
    @category.find(params[:id])
    @category.delete
    redirect_to categories_path
  end
  private
  def category_params
    params.require(:category).permit(:name)
  end

end

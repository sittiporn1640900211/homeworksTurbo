class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: "Category created successfully."
    else
      @categories = Category.all
      render :index, alert: "Category creation failed."
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to categories_path, notice: "Category updated successfully."
    else
      render :edit, alert: "Failed to update category."
    end
  end

  def show
    @category = Category.find_by(id: params[:id])
    if @category.nil?
      redirect_to categories_path, alert: "Category not found."
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to categories_path, notice: "Category deleted successfully."
    else
      redirect_to categories_path, alert: "Failed to delete category."
    end
  end
  

  private

  def category_params
    params.require(:category).permit(:name)
  end
end

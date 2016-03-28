class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @items = @category.items.page(params[:page])
    @categories = Category.all
    render "items/index"
  end
end
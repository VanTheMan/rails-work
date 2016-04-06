class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @items = @category.items.page(params[:page])
    @categories = Category.all
    respond_to do |format|
      format.html { render "items/index" }
      format.json { render json: @category.as_json(include: :items) }
    end
  end
end
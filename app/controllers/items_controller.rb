class ItemsController < ApplicationController
    def index
        @items = Item.all.page(params[:page])
        @categories = Category.all
        respond_to do |format|
          format.html
          format.json { render json: @items }
        end
    end
    
    def show
        @item = Item.find(params[:id])
        @related_items = @item.category.items - [@item]
        @new_reivew = Review.new
        respond_to do |format|
          format.html
          format.json { render json: @item.as_json(include: :reviews) }
        end
    end
    
    def search
        @items = Item.where("title LIKE ?", "%#{params[:query]}%").page(params[:page])
        @categories = Category.all
        render "index"
    end
end
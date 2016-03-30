class ItemsController < ApplicationController
    def index
        @items = Item.all.page(params[:page])
        @categories = Category.all
    end
    
    def show
        @item = Item.find(params[:id])
        @related_items = @item.category.items - [@item]
        @new_reivew = Review.new
    end
    
    def search
        @items = Item.where("title LIKE ?", "%#{params[:query]}%").page(params[:page])
        @categories = Category.all
        render "index"
    end
end
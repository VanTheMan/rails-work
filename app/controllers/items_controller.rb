class ItemsController < ApplicationController
    def index
        @items = Item.all.page(params[:page])
        @categories = Category.all
    end
    
    def show
        @item = Item.find(params[:id])
        @related_items = @item.category.items - [@item]
    end
end
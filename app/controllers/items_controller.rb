class ItemsController < ApplicationController
    def index
        @items = Item.all.page(params[:page])
        @categories = Category.all
    end
    
    def show
        
    end
end
class CartsController < ApplicationController
    def show
        @cart = Cart.find(params[:id])
        @items = @cart.items
    end
    
    def add_item
        
    end
    
    def remove_item
        
    end
end
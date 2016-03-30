class CartsController < ApplicationController
    before_action :authenticate_user!
    def show
        @cart = Cart.find(params[:id])
        @items = @cart.items
    end
    
    def add
        @item = Item.find(params[:item_id])     
        @cart = current_user.cart
        @cart.items << @item
        @cart.save
        redirect_to item_path(@item), :alert => "Add item to cart success"
    end
    
    def remove
        
    end
end
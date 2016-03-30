class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def new
    
  end
  
  def create
    unless current_user.nil?
      @review = current_user.reviews.create(content: params[:content], stars: params[:stars])
      @review.item = Item.find(params[:item_id])
      if @review.save
        @review.item.stars = (@review.item.stars + @review.stars) / 2
        @review.item.save
        redirect_to item_path(@review.item)
      end
    end
  end
end
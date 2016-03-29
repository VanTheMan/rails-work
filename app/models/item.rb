class Item < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :carts
end

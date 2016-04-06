class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :reviews, dependent: :destroy
  has_one :cart, dependent: :destroy
  
  after_create :create_cart

  def is_admin
    self.email.include?("admin")
  end
  
  protected
    def create_cart
      self.cart = Cart.create
    end
end

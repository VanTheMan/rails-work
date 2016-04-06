require 'rails_helper'

RSpec.describe Item, :type => :model do
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }

  context "items has 2 reviews" do
    it "orders them in reverse chronologically" do
      item = Item.create!(:title => "item")
      rv1 = item.reviews.create!(:content => "first review")
      rv2 = item.reviews.create!(:content => "second review")
      expect(item.reload.reviews).to eq([rv1, rv2])
    end
  end
end
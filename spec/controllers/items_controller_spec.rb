require "rails_helper"

RSpec.describe ItemsController, :type => :controller do
  render_views

  describe "GET index" do
    it "renders the index template" do
      sign_in nil
      get :index
      expect(response).to render_template("index")
    end
  end
end
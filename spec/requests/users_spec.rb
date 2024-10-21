require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      user = User.create(email: "user111@gmail.com", password: "12345678", first_name: "Andrew", last_name: "Gor")
      get users_path
      expect(response).to have_http_status(200)
    end
  end
end

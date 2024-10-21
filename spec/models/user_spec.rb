require "rails_helper"

RSpec.describe User, type: :model do
  it "creates new user" do
    user = User.create(email: "user111@gmail.com", password: "12345678", first_name: "Andrew", last_name: "Gor")
    expect(user.email).to eq "user111@gmail.com"
  end
end

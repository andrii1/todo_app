require "rails_helper"

RSpec.describe Comment, type: :model do
  it "creates new comment" do
    comment = Comment.create(text: "Really good task!")
    expect(comment.text).to eq "Really good task!"
  end

  it "is valid with a text, user_id and task_id" do
    task = Task.create(title: "Buy tomatoes", description: "1kg of tomatoes", status: false, due_date: "2024-12-22")
    user = User.create(email: "user111@gmail.com", password: "12345678", first_name: "Andrew", last_name: "Gor")
    comment = Comment.create(text: "Really good task!", task_id: task.id, user_id: user.id)

    expect(comment).to be_valid
  end

  it "is invalid without a text" do
    comment = Comment.new(text: nil)
    comment.valid?
    expect(comment.errors[:text]).to include("can't be blank")
  end

  it "is invalid with a text less than 5 character" do
    comment = Comment.create(text: "Nice")
    comment.valid?
    expect(comment.errors[:text]).to include("is too short (minimum is 5 characters)")
  end
end

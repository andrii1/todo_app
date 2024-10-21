require "rails_helper"

RSpec.describe Task, type: :model do
  it "creates new task" do
    task = Task.create(title: "Buy tomatoes", description: "1kg of tomatoes", status: false, due_date: "2024-12-22")
    expect(task.title).to eq "Buy tomatoes"
  end

  it "is valid with a title, description and due_date" do
    task = Task.create(title: "Buy tomatoes", description: "1kg of tomatoes", status: false, due_date: "2024-12-22")
    expect(task).to be_valid
  end

  it "is invalid without a title" do
    task = Task.new(title: nil)
    task.valid?
    expect(task.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a description" do
    task = Task.new(description: nil)
    task.valid?
    expect(task.errors[:description]).to include("can't be blank")
  end

  it "is invalid with a description less than 5 character" do
    task = Task.create(title: "Buy tomatoes", description: "1kg", status: false, due_date: "2024-12-22")
    task.valid?
    expect(task.errors[:description]).to include("is too short (minimum is 5 characters)")
  end

  it "is invalid without a due_date" do
    task = Task.new(due_date: nil)
    task.valid?
    expect(task.errors[:due_date]).to include("can't be blank")
  end
end

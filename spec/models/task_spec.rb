require "rails_helper"

RSpec.describe Task, type: :model do
  it "creates new task" do
    task = Task.create(title: "Buy tomatoes", description: "1kg of tomatoes", status: false, due_date: "2024-12-22")
    expect(task.title).to eq "Buy tomatoes"
  end
end

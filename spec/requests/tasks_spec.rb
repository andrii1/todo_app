require "rails_helper"

RSpec.describe "Tasks", type: :request do
  let(:task) { Task.create(title: "Buy tomatoes", description: "1kg of tomatoes", status: false, due_date: "2024-12-22") }
  let(:user) { User.create(email: "user111@gmail.com", password: "12345678", first_name: "Andrew", last_name: "Gor") }

  describe "GET /tasks" do
    it "works" do
      sign_in user
      get tasks_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /tasks" do
    it "should render index page" do
      sign_in user
      get tasks_path
      expect(response).to render_template :index
    end
  end

  describe "GET /tasks/:id" do
    it "should render show page" do
      sign_in user
      get task_path(task)
      expect(response).to render_template :show
    end
  end

  describe "Get /New" do
    it "should render new page" do
      sign_in user
      get new_task_path
      expect(response).to render_template :new
    end
  end

  describe "Get /Edit" do
    it "should render edit page" do
      sign_in user
      get edit_task_path(task)
      expect(response).to render_template :edit
    end
  end
end

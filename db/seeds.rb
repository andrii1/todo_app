# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Task.destroy_all
User.destroy_all
puts "everything destroyed"

user1 = User.create!(email: "user1@gmail.com", password: "12345678", first_name: "Andrew", last_name: "Gor")
user2 = User.create!(email: "user2@gmail.com", password: "12345678", first_name: "Andrew2", last_name: "Gor")
user3 = User.create!(email: "user3@gmail.com", password: "12345678", first_name: "Andrew3", last_name: "Gor")

puts "users created"

task1 = Task.create!(title: "Buy milk", description: "1.5% milk", status: false, due_date: "2024-12-20")
task2 = Task.create!(title: "Buy bread", description: "Dark bread", status: false, due_date: "2024-12-21")
task3 = Task.create!(title: "Buy water", description: "1L of water", status: false, due_date: "2024-12-22")

puts "tasks created"

user2.tasks.create(title: "Buy vegetables", description: "Tomatoes", status: false, due_date: "2024-11-20")
task1.users.create(email: "user4@gmail.com", password: "12345678", first_name: "Andrew4", last_name: "Gor")

puts "tasks and users created"

# recipe = Recipe.create({
#   title: "Recipe title here",
#   description: "This is the description",
#   image: "theimage.jpg",
# })

# recipe.ingredients.create(measure: "1cup", modifier: "canned", item: "Mushrooms", note: "drained")
# recipe.ingredients.create(measure: "1lb", modifier: "sliced", item: "Bacon", note: "previously cooked")

# task1.user = user1
# task2.user = user2
# task3.user = user3

puts "users added"

# task1.save
# task2.save
# task3.save

puts "saved....."

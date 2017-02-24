# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
exit if !Rails.env.development?

puts "Deleting Records"
Recipe.delete_all
User.delete_all

puts "Creating non-admin User"
admin = FactoryGirl.create(:user, email: "casvanderhoven@gmail.com", password: "H!jklmn0p", admin: true)

puts "Creating Recipes"
20.times do
  FactoryGirl.create(:recipe, user: admin)
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.destroy_all
User.destroy_all
Book.destroy_all

User.create([
    {username:"Dan", email:"Dan@dan.com", password:"pw"}

])

Book.create([
    {title:"The Book", author:"Author Author", length:1, year:2000}
])


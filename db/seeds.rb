# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Book.destroy_all

users = User.create([
    {username:"Katie", email:"Katie@katie.com", password:"pw"},
    {username:"Dan", email:"Dan@dan.com", password:"pw"}
])

books = Book.create([
    {title:"Angels & Demons", author:"Dan Brown", length:1, year: 2006},
    {title:"The Cardinal of the Kremlin", author:"Tom Clancy", length:1, year: 1998},
    {title:"The Mister", author:"E. L. James", length:1, year: 2019}
])

Review.create([
    {
        content:"The author’s follow-up to her Fifty Shades series is hopelessly retrograde. That said I loved it.",
        rating: 3,
        user_id: users.first.id,
        book_id: books.last.id
    },
    {
        content:"Dan Brown did it again! What a great book. Loved every second, who knew I could get so invested in the life of a  Harvard symbologist.",
        rating: 4,
        user_id: users.first.id,
        book_id: books.first.id
    },
    {
        content:"A very solid, entertaining book. Le classique, as the French would say. It's got the right dose of technology, warfare, sci-fi hi-tech stuff, espionage, bad Russians, good Russians, noble Russians, Afghanistan, satellites, LASERS, friggin' lasers, narrate that Dr. Evil style, everything you can expect from an 80s cocktail of Texas Ranger meets MIT postgrad meets someone who's read about Soviet interrogation methods and how women think on USENET.",
        rating: 5,
        user_id: users.last.id,
        book_id: books[1].id
    },
    {
        content:"I was left... STUNNED! Just, just, stunned. Incredibly, this one is the one to top when it comes to adventure & history and pace & ingenuity.",
        rating: 5,
        user_id: users.last.id,
        book_id: books.first.id
    }
])
Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)

Genre.create!(
    name: "餅",
    )

Item.create!(
    genre_id: 1,
    name: "醤油餅",
    tax_free_cost: 100,
    stock_status: 1,
    )
#  　 email: "nagano@cake",
#     password: "administrator"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

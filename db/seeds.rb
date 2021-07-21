# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ideas = [
    {name: "Cool app", tagline: "This is a cool app you want to work on!", description: "a cool description"}, 
    {name: "Silly app", tagline: "You will have fun working on this app", description: "a silly description"}
]
ideas.each { |idea| Idea.find_or_create_by!(idea) }
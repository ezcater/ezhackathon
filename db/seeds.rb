# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

["Cool app", "Silly app"].each do |name|
  Idea.find_or_create_by!(name: name) do |idea|
    idea.tagline = "#{name} you probably want to work on!"
    idea.description = "A #{name.downcase} description."
    idea.submitter = "Seed Database"
    idea.resources = "Check out the wiki."
    idea.hours_estimate = rand(32)
    idea.value_delivered = "Everyone loves a #{name.downcase}."
    idea.goal = "To get people together and create a #{name.downcase}."
  end
end

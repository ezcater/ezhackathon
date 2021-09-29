# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Award.find_or_create_by!(title: "Culture cupcake")
Award.find_or_create_by!(title: "Most likely to make it into production")

next_event = Event.find_or_create_by!(participants: "Anyone!") do |event|
  event.agenda = "Hack on some fun, new projects."
  event.demo_links = "None yet."
  event.place = "Anywhere"
  event.time = 1.year.from_now
end

ideas = ["Cool app", "Silly app", "Accepted app"].map do |name|
  Idea.find_or_create_by!(name: name) do |idea|
    idea.description = "A #{name.downcase} description."
    idea.goal = "To get people together and create a #{name.downcase}."
    idea.hours_estimate = rand(32)
    idea.resources = "Check out the wiki."
    idea.submitter = "Seed Database"
    idea.tagline = "#{name} you probably want to work on!"
    idea.value_delivered = "Everyone loves a #{name.downcase}."
  end
end

Project.find_or_create_by!(event: next_event, idea: ideas.last)

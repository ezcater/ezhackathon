# frozen_string_literal: true

require "rails_helper"

# feature "when user creates a new event" do
#     scenario "user successfully creates new event" do
#       visit '/events'
#       click_button "Submit a new event"

#       expect(page).to have_content "Submit an Event"

#       fill_in "event[start_time]", with: DateTime.new(1)
#       fill_in "event[end_time]", with: DateTime.new(2)
#       fill_in "event[place]", with: "Virtual"
#       fill_in "event[agenda]", with: "10am: hacking"
#       fill_in "event[organizers]", with: "Rachael, Kai"

#       click_button "Create Event"

#       expect(page).to have_content "Event successfully added!"
#       expect(page).to have_content DateTime.new(1)
#       expect(page).to have_content DateTime.new(2)
#     end

#     scenario "user does not enter all required information" do
#       visit '/events'
#       click_button "Submit a new event"

#       expect(page).to have_content "Submit an Event"

#       fill_in "event[start_time]", with: DateTime.new(1)
#       fill_in "event[end_time]", with: DateTime.new(2)
#       fill_in "event[place]", with: "Virtual"

#       click_button "Create Event"

#       expect(page).to have_content "Agenda can't be blank"
#       expect(page).to have_content "Organizers can't be blank"
#     end
# end

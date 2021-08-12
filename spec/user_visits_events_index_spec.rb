# frozen_string_literal: true

require "rails_helper"

# feature "when visiting the events index page" do
#   let!(:event_1) { FactoryBot.create(:event) }
#   let!(:event_2) { FactoryBot.create(:event) }

#   scenario "user sees a list of event start times and end times" do
#     visit '/events'

#     expect(page).to have_content(event_1.start_time)
#     expect(page).to have_content(event_2.start_time)
#     expect(page).to have_content(event_1.end_time)
#     expect(page).to have_content(event_2.end_time)
#   end

#   scenario "user clicks an event and sees details about the event" do
#     visit '/events'
#     click_link(event_1.start_time)

#     expect(page).to have_content(event_1.start_time)
#     expect(page).to have_content(event_1.end_time)
#     expect(page).to have_content(event_1.place)
#     expect(page).to have_content(event_1.agenda)
#     expect(page).to have_content(event_1.organizers)
#   end
# end

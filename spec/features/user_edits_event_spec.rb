# frozen_string_literal: true

require "rails_helper"

feature "when user edits an event" do
  let!(:event) { create(:event) }

  scenario "user successfully edits an event's voting status" do
    visit edit_event_path(event)

    select "Voting Started", from: "event[voting_status]"

    click_button "Update Event"

    expect(page).to have_content "Event successfully updated!"
    expect(page).to have_content "Voting is open"
  end
end

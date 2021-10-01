# frozen_string_literal: true

require "rails_helper"

feature "when visiting the events index page" do
  include DateHelper

  let!(:event_1) { create(:event, time: 1.month.ago) }
  let!(:event_2) { create(:event) }

  scenario "user sees a list of event start times and end times" do
    visit events_path

    expect(page).to have_content(format_date(event_1.time))
    expect(page).to have_content(format_date(event_2.time))
  end

  scenario "user clicks an event and sees details about the event" do
    visit events_path
    click_link format_date(event_1.time)

    expect(page).to have_content(format_date(event_1.time))
    expect(page).to have_content(event_1.agenda)
    expect(page).to have_content(event_1.participants)
  end

  scenario "displays recent or upcoming event when present on root" do
    visit "/"

    expect(page).to have_content(format_date(event_2.time))
    expect(page).not_to have_content("Create an Event")
  end

  scenario "user sees a list of events on root with no recent or upcoming event" do
    visit events_path

    expect(page).to have_content(format_date(event_1.time))
    expect(page).to have_content(format_date(event_2.time))
    expect(page).to have_content("Create an Event")
  end
end

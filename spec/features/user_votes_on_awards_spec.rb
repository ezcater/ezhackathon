# frozen_string_literal: true

require "rails_helper"

feature "when user votes on awards for an event" do
  let!(:event) { create(:event, time: "2021-09-30") }

  let!(:awards) do
    [
      "Most likely to make it into production",
      "Most likely to break production",
    ].map { |title| create(:award, title: title) }
  end

  let!(:projects) do
    [
      "A useful idea",
      "An idea that just might work",
      "Hey, how about we convert the entire codebase to COBOL?",
    ].map do |name|
      create(:project, event: event, idea: create(:idea, name: name))
    end
  end

  scenario "user starts voting" do
    visit new_event_vote_path(event)
    expect(page).to have_content "September 2021 Voting"

    awards.each do |award|
      expect(page).to have_content award.title
    end

    projects.each do |project|
      expect(page).to have_content project.name
    end

    fill_in :username, with: "Test User"

    click_button "start_voting"

    expect(page).to have_content "Award 1 of 2"
    projects.each do |project|
      expect(page).to have_content project.name
    end
  end
end

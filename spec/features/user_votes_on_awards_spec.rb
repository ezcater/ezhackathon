# frozen_string_literal: true

require "rails_helper"

feature "when user votes on awards for an event" do
  let!(:event) { create(:event, time: "2021-09-30") }

  let!(:awards) do
    [
      "Most likely to break production",
      "Most likely to make it into production",
    ].map { |title| create(:award, title: title) }
  end

  let!(:projects) do
    [
      "A useful idea",
      "An idea that just might work",
      "Hey, how about we convert the entire codebase to COBOL?",
    ].map.with_index do |name, index|
      create(
        :project,
        event: event,
        links: "https://example.com/#{index}",
        idea: create(:idea, name: name)
      )
    end
  end

  scenario "user starts voting" do
    event.update!(voting_status: :voting_started)

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

    projects.each do |project|
      expect(page).to have_content project.name
      expect(page).to have_link nil, href: project.links
    end
  end

  scenario "user votes for all awards" do
    event.update!(voting_status: :voting_started)

    original_vote_count = Vote.count

    visit new_event_vote_path(event)
    fill_in :username, with: "Test User"
    click_button "start_voting"

    expect(page).to have_content "Most likely to break production"
    expect(page).to have_content "Award 1 of 2"
    choose "Hey, how about we convert the entire codebase to COBOL?"
    click_button "vote"

    expect(page).to have_content "Most likely to make it into production"
    choose "An idea that just might work"
    click_button "vote"

    expect(page).to have_content "Thank you for voting! Check out the results so far."
    expect(Vote.count).to eq original_vote_count + 2
  end

  scenario "user cannot vote on event before voting started" do
    event.update!(voting_status: :voting_not_started)

    visit new_event_vote_path(event)
    expect(page).not_to have_selector("#start_voting")

    visit new_event_vote_path(event, award_id: awards.first.id, username: "cheater")
    expect(page).not_to have_selector("vote")
  end

  scenario "user cannot vote on event after voting finished" do
    event.update!(voting_status: :voting_finished)

    visit new_event_vote_path(event)
    expect(page).not_to have_selector("#start_voting")

    visit new_event_vote_path(event, award_id: awards.first.id, username: "cheater")
    expect(page).not_to have_selector("vote")
  end
end

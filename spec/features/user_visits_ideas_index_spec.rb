# frozen_string_literal: true

require "rails_helper"

feature "when visiting the ideas index page" do
  let!(:idea_1) { FactoryBot.create(:idea) }
  let!(:idea_2) { FactoryBot.create(:idea) }

  scenario "user sees a list of idea names and taglines" do
    visit "/ideas"

    expect(page).to have_content(idea_1.name)
    expect(page).to have_content(idea_1.tagline)
    expect(page).to have_content(idea_2.name)
    expect(page).to have_content(idea_2.tagline)
  end

  scenario "user clicks an idea and sees details about the idea" do # rubocop:disable RSpec/MultipleExpectations
    visit "/ideas"
    click_link(idea_1.name)

    expect(page).to have_content(idea_1.name)
    expect(page).to have_content(idea_1.tagline)
    expect(page).to have_content(idea_1.description)
    expect(page).to have_content(idea_1.resources)
    expect(page).to have_content(idea_1.snowflake_access)
    expect(page).to have_content(idea_1.value_delivered)
    expect(page).to have_content(idea_1.goal)
    expect(page).to have_content(idea_1.hours_estimate)
  end
end

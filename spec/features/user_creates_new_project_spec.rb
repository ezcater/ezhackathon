# frozen_string_literal: true

require "rails_helper"

feature "when user creates a new project" do
  let!(:event) { create(:event) }
  let!(:idea) { create(:idea, name: "A great idea") }

  scenario "user successfully creates new project" do
    visit event_path(event)
    click_button "Add a New Project"

    expect(page).to have_content "Submit a New Project"

    select "A great idea", from: "project[idea_id]"

    click_button "Create Project"

    expect(page).to have_content "Project added successfully"
    expect(page).to have_content "A great idea"
  end

  scenario "user does not enter all required information" do
    visit event_path(event)
    click_button "Add a New Project"

    click_button "Create Project"

    expect(page).to have_content "Idea must exist"
  end
end

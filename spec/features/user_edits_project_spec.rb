# frozen_string_literal: true

require "rails_helper"

feature "when user edits a project" do
  let!(:event) { create(:event, time: "2021-09-30") }
  let!(:idea) { create(:idea, name: "A great idea") }
  let!(:project) { create(:project, event: event, idea: idea) }

  scenario "user successfully creates new project" do
    visit edit_event_project_path(event, project)

    expect(page).to have_content idea.name
    expect(page).to have_content "Thursday September 30, 2021"

    fill_in "project[links]", with: "https://example.com/my-great-idea-writeup"

    click_button "Update Project"

    expect(page).to have_content "Project successfully updated"
    expect(page).to have_content "A great idea"
    expect(project.reload.links).to eq "https://example.com/my-great-idea-writeup"
  end
end

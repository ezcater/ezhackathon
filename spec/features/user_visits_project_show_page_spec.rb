# frozen_string_literal: true

require "rails_helper"

feature "when visiting a project show page" do
  let(:idea) { create(:idea) }
  let(:event) { create(:event) }

  context "project doesn't have an artifact" do
    let(:project) { create(:project, idea: idea, event: event, links: "") }

    scenario "user sees details about a project" do
      visit event_project_path(event, project)

      expect(page).to have_content project.name
      expect(page).to have_content project.additional_comments
      expect(page).not_to have_content "Project Artifact"
    end
  end

  context "project has an artifact" do
    let(:project) { create(:project, idea: idea, event: event, links: "https://www.ezcater.com") }

    scenario "user sees details about a project and a link to the artifact" do
      visit event_project_path(event, project)

      expect(page).to have_content project.name
      expect(page).to have_content project.additional_comments
      expect(page).to have_content "Project Artifact"
    end
  end
end

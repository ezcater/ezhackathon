# frozen_string_literal: true

require "rails_helper"

feature "when visiting the event awards index page" do
  let!(:event) { create(:event) }

  scenario "user sees a list of awards" do
    awards = create_list(:award, 2)

    visit "/events/#{event.id}/awards"

    awards.each do |award|
      expect(page).to have_content(award.title)
    end
  end

  scenario "user sees each project with votes" do
    award = create(:award)
    project_1, project_2 = create_list(:project, 2, event: event)
    create(:vote, award: award, event: event, project: project_1)
    create_list(:vote, 2, award: award, event: event, project: project_2)

    visit "/events/#{event.id}/awards"

    expect(page).to have_content("#{project_2.idea.name} (2 votes)")
    expect(page).to have_content("#{project_1.idea.name} (1 vote)")
  end

  scenario "user sees each projects ordered by votes" do
    award = create(:award)
    project_1, project_2 = create_list(:project, 2, event: event)
    create(:vote, award: award, event: event, project: project_1)
    create_list(:vote, 2, award: award, event: event, project: project_2)

    visit "/events/#{event.id}/awards"

    expect(page).to have_content(/#{project_2.idea.name}.*#{project_1.idea.name}/)
  end

  scenario "user sees winner and runner up when voting is complete" do
    award = create(:award)
    project_1, project_2 = create_list(:project, 3, event: event)
    create(:vote, award: award, event: event, project: project_1)
    create_list(:vote, 2, award: award, event: event, project: project_2)

    visit "/events/#{event.id}/awards?voting_complete=true"

    expect(page).to have_content("Winner: #{project_2.idea.name}")
    expect(page).to have_content("Runner-up: #{project_1.idea.name}")
    expect(page).not_to have_content("vote")
  end
end

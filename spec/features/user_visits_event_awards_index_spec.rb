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

  scenario "when voting is started user sees each project with votes" do
    event.voting_started!
    award = create(:award)
    project_1, project_2 = create_list(:project, 2, event: event)
    create(:vote, award: award, event: event, project: project_1)
    create_list(:vote, 2, award: award, event: event, project: project_2)

    visit "/events/#{event.id}/awards"

    expect(page).to have_content("#{project_2.name} (2 votes)")
    expect(page).to have_content("#{project_1.name} (1 vote)")
  end

  scenario "when voting is starting and projects have the same count" do
    event.voting_started!
    award = create(:award)
    project_1, project_2 = create_list(:project, 2, event: event)
    create(:vote, award: award, event: event, project: project_1)
    create(:vote, award: award, event: event, project: project_2)

    visit "/events/#{event.id}/awards"

    expect(page).to have_content("#{project_1.name} and #{project_2.name} (1 vote)")
  end

  scenario "when voting is started user sees each projects ordered by votes" do
    event.voting_started!
    award = create(:award)
    project_1, project_2 = create_list(:project, 2, event: event)
    create(:vote, award: award, event: event, project: project_1)
    create_list(:vote, 2, award: award, event: event, project: project_2)

    visit "/events/#{event.id}/awards"

    expect(page).to have_content(/#{project_2.name}.*#{project_1.name}/)
  end

  scenario "user sees winner and runner-up when voting is finished" do
    event.voting_finished!
    award = create(:award)
    project_1, project_2 = create_list(:project, 3, event: event)
    create(:vote, award: award, event: event, project: project_1)
    create_list(:vote, 2, award: award, event: event, project: project_2)

    visit "/events/#{event.id}/awards?voting_complete=true"

    expect(page).to have_content("Winner: #{project_2.name}")
    expect(page).to have_content("Runner-up: #{project_1.name}")
    expect(page).not_to have_content("vote")
  end

  scenario "user sees tied winners and runner-ups when voting is finished" do
    event.voting_finished!
    award = create(:award)
    project_1, project_2, project_3, project_4 = create_list(:project, 5, event: event)
    create_list(:vote, 2, award: award, event: event, project: project_1)
    create_list(:vote, 2, award: award, event: event, project: project_2)
    create(:vote, award: award, event: event, project: project_3)
    create(:vote, award: award, event: event, project: project_4)

    visit "/events/#{event.id}/awards?voting_complete=true"

    expect(page).to have_content("Winner: #{project_1.name} and #{project_2.name}")
    expect(page).to have_content("Runner-up: #{project_3.name} and #{project_4.name}")
    expect(page).not_to have_content("vote")
  end
end

# frozen_string_literal: true

require "rails_helper"

feature "when user creates a new idea" do
  scenario "user successfully creates new idea" do
    visit "/ideas"
    click_link "Submit an Idea"

    expect(page).to have_content "Submit an Idea"

    fill_in "idea[submitter]", with: "Kai"
    fill_in "idea[name]", with: "Kai's idea"
    fill_in "idea[tagline]", with: "Kai came up with this idea"
    fill_in "idea[description]", with: "This is an idea that Kai came up with"
    fill_in "idea[resources]", with: "4 devs"
    # fill_in "idea[snowflake_access]", with: true
    fill_in "idea[value_delivered]", with: "some value"
    fill_in "idea[goal]", with: "To build an MVP"
    fill_in "idea[hours_estimate]", with: 10

    click_button "Create Idea"

    expect(page).to have_content "Idea successfully added!"
    expect(page).to have_content "Kai's idea"
    expect(page).to have_content "Kai came up with this idea"
  end

  scenario "user does not enter all required information" do
    visit "/ideas"
    click_link "Submit an Idea"

    expect(page).to have_content "Submit an Idea"

    fill_in "idea[submitter]", with: "Kai"
    fill_in "idea[name]", with: "Kai's idea"
    fill_in "idea[tagline]", with: "Kai came up with this idea"
    fill_in "idea[description]", with: "This is an idea that Kai came up with"
    fill_in "idea[resources]", with: "4 devs"

    click_button "Create Idea"

    expect(page).to have_content "Value delivered can't be blank"
    expect(page).to have_content "Goal can't be blank"
    expect(page).to have_content "Hours estimate can't be blank"
  end
end

# frozen_string_literal: true

RSpec.describe Idea do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:tagline) }
  it { is_expected.to validate_length_of(:tagline).is_at_most(500) }
  it { is_expected.to validate_presence_of(:submitter) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:resources) }
  it { is_expected.to validate_presence_of(:value_delivered) }
  it { is_expected.to validate_presence_of(:goal) }
  it { is_expected.to validate_presence_of(:hours_estimate) }

  describe ".without_projects" do
    it "returns just the ideas that do not have projects" do
      create_list(:project, 2).map(&:idea)
      ideas_without_projects = create_list(:idea, 2)

      expect(described_class.without_projects).to match_array(ideas_without_projects)
    end
  end
end

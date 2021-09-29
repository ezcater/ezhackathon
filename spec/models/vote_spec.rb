# frozen_string_literal: true

require "rails_helper"

RSpec.describe Vote, type: :model do
  subject { create(:vote) }

  it { is_expected.to belong_to(:award).required }
  it { is_expected.to belong_to(:event).required }
  it { is_expected.to belong_to(:project).required }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:event_id, :award_id).case_insensitive }
end

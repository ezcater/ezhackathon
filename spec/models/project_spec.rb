# frozen_string_literal: true

RSpec.describe Project do
  it { is_expected.to belong_to(:event) }
  it { is_expected.to belong_to(:idea) }

  it { is_expected.to have_many(:votes).dependent(:destroy) }
end

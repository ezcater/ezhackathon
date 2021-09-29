# frozen_string_literal: true

RSpec.describe Project do
  it { is_expected.to belong_to(:event) }
  it { is_expected.to belong_to(:idea) }
end

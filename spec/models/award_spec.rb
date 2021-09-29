# frozen_string_literal: true

RSpec.describe Award do
  it { is_expected.to validate_presence_of(:title) }
end

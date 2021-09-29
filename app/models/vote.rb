# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :award, optional: false
  belongs_to :event, optional: false
  belongs_to :project, optional: false

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false, scope: %i(event_id award_id) }
end

# frozen_string_literal: true

class Project < ApplicationRecord
  # delegated to idea
  self.ignored_columns = %w(
    name
    tagline
    description
    resources
    snowflake_access
    value_delivered
    goal
    hours_estimate
  )

  belongs_to :event
  belongs_to :idea
end

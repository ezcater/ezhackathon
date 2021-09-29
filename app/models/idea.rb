# frozen_string_literal: true

class Idea < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :tagline, presence: true, length: { maximum: 500 }
  validates :submitter, :description, :resources, :value_delivered, :goal, :hours_estimate, presence: true

  scope :without_projects, ->{
    joins("LEFT JOIN projects ON ideas.id = projects.idea_id").
      where(projects: { id: nil })
  }
end

# frozen_string_literal: true

class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :tagline, presence: true, length: { maximum: 500 }
  validates :description, :resources, :value_delivered, :goal, :hours_estimate, presence: true

  belongs_to :event
end

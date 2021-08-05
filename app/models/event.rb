# frozen_string_literal: true

class Event < ApplicationRecord
  validates :time, :place, :agenda, :participants, presence: true

  has_many :projects, dependent: :restrict_with_exception
end

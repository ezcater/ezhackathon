# frozen_string_literal: true

class Event < ApplicationRecord
  validates :time, :place, :agenda, :participants, :demo_links, presence: true

  has_many :projects, dependent: :restrict_with_exception
end

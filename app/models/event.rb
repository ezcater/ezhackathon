# frozen_string_literal: true

class Event < ApplicationRecord
  validates :time, :place, :agenda, :participants, presence: true
end

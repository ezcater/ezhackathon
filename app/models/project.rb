# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :event
  belongs_to :idea

  has_many :votes, dependent: :destroy

  delegate :name, to: :idea
end

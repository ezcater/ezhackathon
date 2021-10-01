# frozen_string_literal: true

class Event < ApplicationRecord
  validates :time, :place, :agenda, :participants, :demo_links, :voting_status, presence: true

  has_many :projects, dependent: :restrict_with_exception
  has_many :votes, dependent: :destroy

  enum voting_status: {
    voting_not_started: "voting_not_started",
    voting_started: "voting_started",
    voting_finished: "voting_finished",
  }

  def self.recent_or_future
    where("time >= ?", 7.days.ago)
  end
end

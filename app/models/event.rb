# frozen_string_literal: true

class Event < ApplicationRecord
  validates :time, :place, :agenda, :participants, :demo_links, presence: true

  has_many :projects, dependent: :restrict_with_exception
  has_many :votes, dependent: :destroy

  def voting_enabled?
    true # Perhaps change this based on a status / stage column?
  end
end

# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :award, optional: false
  belongs_to :event, optional: false
  belongs_to :project, optional: false

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false, scope: %i(event_id award_id) }

  after_create :broadcast_to_event_leaderboard

  private

  def broadcast_to_event_leaderboard
    Turbo::StreamsChannel.broadcast_update_to(
      event,
      target: event,
      partial: "awards/awards",
      locals: {
        awards: event.awards_with_projects_ordered_by_votes,
        event: event,
      }
    )
  end
end

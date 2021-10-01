# frozen_string_literal: true

module EventHelper
  def voting_status_options(event)
    options_for_select(
      Event.voting_statuses.map { |name, value| [name.titleize, value] },
      event.voting_status
    )
  end
end

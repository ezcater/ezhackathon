# frozen_string_literal: true

class AwardsController < ApplicationController
  def index
    @event  = Event.find(params[:event_id])
    @awards = @event.awards_with_projects_ordered_by_votes
  end
end

# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :load_event

  def new
    strategy = ::Voting::UrlControlledVotingStrategy.new(params: params)
    @state = ::Voting::State.new(control_strategy: strategy, event: @event)
  end

  private

  def load_event
    @event = Event.find(params[:event_id])
  end
end

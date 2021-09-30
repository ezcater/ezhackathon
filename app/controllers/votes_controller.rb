# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :load_event
  before_action :load_control_strategy
  before_action :load_state
  before_action :ensure_can_vote

  def new
    if params[:username]
      @control_strategy.start_voting(params[:username])
    end
  end

  def create
    project = Project.find(params[:project_id])
    @vote = Vote.create!(
      award: @state.current_award,
      project: project,
      name: @state.username,
      event: @event
    )
    flash[:success] = "Vote successfully recorded"
    redirect_to @control_strategy.build_next_path(@state)
  end

  private

  def load_event
    @event = Event.find(params[:event_id])
  end

  def load_control_strategy
    @control_strategy = ::Voting::CookieControlledVotingStrategy.new(
      cookies: cookies,
      current_award_id: params[:award_id]
    )
  end

  def load_state
    @state = ::Voting::State.new(control_strategy: @control_strategy, event: @event)
  end

  def ensure_can_vote
    if !@event.voting_started? && params[:award_id]
      flash[:notice] = "Voting is not currently enabled"
      redirect_to new_event_vote_path(@event)
    end
  end
end

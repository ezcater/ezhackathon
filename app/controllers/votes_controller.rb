# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :load_event

  def new
    @username = params[:username]
    @finished_voting = params[:finished_voting] || false
  end

  private

  def load_event
    @event = Event.find(params[:event_id])
  end

  def user_started_voting?
    @username.present?
  end
  helper_method :user_started_voting?

  def user_finished_voting?
    @finished_voting
  end
  helper_method :user_finished_voting?
end

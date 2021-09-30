# frozen_string_literal: true

module Voting
  class UrlControlledVotingStrategy
    def initialize(params:)
      @params = params
    end

    def username
      @params[:username]
    end

    def user_started_voting?
      username.present?
    end

    def user_finished_voting?
      @params[:finished_voting] || false
    end

    def current_award_id
      @params[:award_id]
    end

    def build_next_path(voting_state)
      next_params = { username: username }

      if voting_state.next_award.present?
        next_params[:award_id] = voting_state.next_award.id
      else
        next_params[:finished_voting] = true
      end

      Rails.application.routes.url_helpers.new_event_vote_path(
        voting_state.event,
        **next_params
      )
    end
  end
end

# frozen_string_literal: true

module Voting
  class CookieControlledVotingStrategy
    attr_reader :current_award_id

    def initialize(cookies:, current_award_id:)
      @cookies = cookies
      @current_award_id = current_award_id
    end

    def start_voting(username)
      @cookies[:username] ||= username
    end

    def username
      @cookies[:username]
    end

    def user_started_voting?
      username.present?
    end

    def unfinished?
      user_started_voting? && !user_finished_voting?
    end

    def build_next_path(voting_state)
      next_params = {}

      if voting_state.next_award.present?
        next_params[:award_id] = voting_state.next_award.id
      end

      Rails.application.routes.url_helpers.new_event_vote_path(
        voting_state.event,
        **next_params
      )
    end
  end
end

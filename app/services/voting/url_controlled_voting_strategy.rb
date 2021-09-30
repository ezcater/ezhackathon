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
  end
end

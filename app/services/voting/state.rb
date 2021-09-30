# frozen_string_literal: true

module Voting
  class State
    attr_reader :event

    def initialize(control_strategy:, event:)
      @control_strategy = control_strategy
      @event = event
    end

    delegate :username,
             :user_started_voting?,
             :user_finished_voting?,
             :current_award_id,
             to: :@control_strategy

    def ordered_projects
      @_ordered_projects ||= projects.order("ideas.name")
    end

    def shuffled_projects
      projects.shuffle
    end

    def awards
      @_awards ||= Award.order(:title)
    end

    def current_award
      return @_current_award if defined? @_current_award

      @_current_award = current_award_id.nil? ? nil : Award.find(current_award_id)
    end

    def next_award
      return @_next_award if defined? @_next_award

      @_next_award = if current_award.nil?
                       awards.first
                     elsif current_award == awards.last
                       nil
                     else
                       awards[current_award_index + 1]
                     end
    end

    def current_award_index
      @_current_award_index ||= if current_award.nil?
                                  0
                                else
                                  awards.find_index { |award| award == current_award }
                                end
    end

    def submit_label
      next_award.present? ? "Vote and move to next award" : "Vote"
    end

    private

    def projects
      event.projects.includes(:idea)
    end
  end
end

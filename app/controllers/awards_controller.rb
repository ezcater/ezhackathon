# frozen_string_literal: true

class AwardsController < ApplicationController
  VOTING_COMPLETE_WINNERS = 2

  def index
    @event  = event
    @awards = awards_with_projects_ordered_by_votes
  end

  protected

  def awards_with_projects_ordered_by_votes
    Award.order(:title).each_with_object({}) do |award, rankings|
      rankings[award] = projects_ordered_by_votes_for(award).limit(project_limit)
    end
  end

  def event
    @_event ||= Event.find(params[:event_id])
  end

  def project_limit
    if voting_complete?
      VOTING_COMPLETE_WINNERS
    end
  end

  def projects_ordered_by_votes_for(award)
    event.projects.
      select("projects.*, COUNT(votes.id) AS vote_count").
      includes(:idea).
      joins("LEFT OUTER JOIN votes ON votes.award_id = #{award.id} AND votes.project_id = projects.id").
      group(:id).
      order(vote_count: :desc)
  end

  def voting_complete?
    params[:voting_complete].present?
  end
  helper_method :voting_complete?
end

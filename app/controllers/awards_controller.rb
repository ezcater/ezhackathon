# frozen_string_literal: true

class AwardsController < ApplicationController
  VOTING_COMPLETE_WINNERS = 2

  def index
    @event  = event
    @awards = awards_with_projects_ordered_by_votes

    if event.voting_started?
      @refresh_interval = 5
    end
  end

  protected

  def awards_with_projects_ordered_by_votes
    Award.order(:title).each_with_object({}) do |award, rankings|
      if event.voting_not_started?
        projects = event.projects.all.group_by(&:id)
      else
        projects = projects_ordered_by_votes_for(award).group_by(&:vote_count)
        projects = projects.first(project_limit) if project_limit
      end

      rankings[award] = projects
    end
  end

  def event
    @_event ||= Event.find(params[:event_id])
  end

  def project_limit
    if event.voting_finished?
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
end

# frozen_string_literal: true

class Event < ApplicationRecord
  validates :time, :place, :agenda, :participants, :demo_links, presence: true

  has_many :projects, dependent: :restrict_with_exception
  has_many :votes, dependent: :destroy

  def awards_with_projects_ordered_by_votes
    Award.order(:title).each_with_object({}) do |award, rankings|
      rankings[award] = projects_ordered_by_votes_for(award)
    end
  end

  def voting_complete?
    false
  end

  protected

  def projects_ordered_by_votes_for(award)
    projects.
      select("projects.*, COUNT(votes.id) AS vote_count").
      includes(:idea).
      joins("LEFT OUTER JOIN votes ON votes.award_id = #{award.id} AND votes.project_id = projects.id").
      group(:id).
      order(vote_count: :desc)
  end
end

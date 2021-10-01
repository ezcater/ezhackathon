# frozen_string_literal: true

class AddVotingStatusToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :voting_status, :string, null: false, default: "voting_not_started"
  end
end

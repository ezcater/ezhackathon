# frozen_string_literal: true

class LinkProjectsToIdeas < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    # Rubocop wants this column to have a default value as it is now NOT NULL
    # However, that doesn't make any sense for a reference / foreign key column
    #
    # rubocop:disable Rails/NotNullColumn
    add_reference :projects, :idea, index: { algorithm: :concurrently }, null: false
    # rubocop:enable Rails/NotNullColumn
  end
end

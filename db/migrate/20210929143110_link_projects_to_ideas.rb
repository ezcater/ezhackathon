# frozen_string_literal: true

class LinkProjectsToIdeas < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_reference :projects, :idea, index: { algorithm: :concurrently }, null: false
  end
end

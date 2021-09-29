# frozen_string_literal: true

class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.belongs_to :award, null: false
      t.belongs_to :event, null: false
      t.belongs_to :project, null: false

      t.string :name, null: false

      t.index %i(event_id award_id name), unique: true

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :tagline, null: false, length: 500 #change this to brief summary
      # t.text :description, null: false
      # t.string :resources, null: false
      # t.boolean :snowflake_access
      # t.string :value_delivered, null: false
      # t.string :goal, null: false
      # t.integer :hours_estimate, null: false
      # t.string :additional_comments
      # t.string :links

      #add array: of participants/team
      #add belongs_to association: to idea if exists
      #add string: single link to confluence page, all other links go in confluence page for now

      t.belongs_to :event, null: false
      t.timestamps
    end
  end
end

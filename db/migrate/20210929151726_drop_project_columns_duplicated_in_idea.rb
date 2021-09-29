# frozen_string_literal: true

class DropProjectColumnsDuplicatedInIdea < ActiveRecord::Migration[6.0]
  def change
    safety_assured do
      remove_column :projects, :name, :string, null: false
      remove_column :projects, :tagline, :string, null: false, length: 500
      remove_column :projects, :description, :string, null: false
      remove_column :projects, :resources, :string, null: false
      remove_column :projects, :snowflake_access, :boolean
      remove_column :projects, :value_delivered, :string, null: false
      remove_column :projects, :goal, :string, null: false
      remove_column :projects, :hours_estimate, :integer, null: false
    end
  end
end

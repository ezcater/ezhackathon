class UpdateProjectsTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :tagline, :summary

    remove_column :projects, :description
    remove_column :projects, :resources
    remove_column :projects, :snowflake_access
    remove_column :projects, :value_delivered
    remove_column :projects, :goal
    remove_column :projects, :hours_estimate
    remove_column :projects, :additional_comments
    remove_column :projects, :links

    add_column :projects, :confluence_link, null: false
    add_column :projects, :participants, :string, array: true, default: []

    add_reference :projects, :idea, foreign_key: true
  end
end

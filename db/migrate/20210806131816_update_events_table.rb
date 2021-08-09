class UpdateEventsTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :participants, :organizers
    rename_column :events, :time, :start_time

    add_column :events, :end_time, :datetime, null: false

    remove_column :events, :demo_links
    remove_column :events, :silly_answers 
  end
end

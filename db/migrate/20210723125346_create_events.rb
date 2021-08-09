# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :time, null: false #start_time, #end_time
      t.string :place, null: false
      t.text :agenda, null: false
      t.string :organizers, null: false #organizers
      # t.text :demo_links, null: false
      # t.text :silly_answers

      t.timestamps
    end
  end
end

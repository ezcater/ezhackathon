class CreateIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :ideas do |t|
      t.string :name, null: false
      t.string :tagline, null: false, length: 500
      t.string :description, null: false

      t.timestamps
    end
  end
end

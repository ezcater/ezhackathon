# frozen_string_literal: true

class AddSubmitterToIdeas < ActiveRecord::Migration[6.0]
  def change
    add_column :ideas, :submitter, :string
  end
end

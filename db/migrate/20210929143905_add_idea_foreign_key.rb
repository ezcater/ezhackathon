# frozen_string_literal: true

class AddIdeaForeignKey < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :projects, :ideas, validate: false
  end
end

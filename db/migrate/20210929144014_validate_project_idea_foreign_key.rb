# frozen_string_literal: true

class ValidateProjectIdeaForeignKey < ActiveRecord::Migration[6.0]
  def change
    validate_foreign_key :projects, :ideas
  end
end

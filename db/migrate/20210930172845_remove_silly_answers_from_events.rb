# frozen_string_literal: true

class RemoveSillyAnswersFromEvents < ActiveRecord::Migration[6.0]
  def change
    safety_assured do
      remove_column :events, :silly_answers, :text
    end
  end
end

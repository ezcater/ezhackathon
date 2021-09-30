# frozen_string_literal: true

module AwardHelper
  def award_place(index)
    if index.zero?
      "Winner"
    elsif index == 1
      "Runner-up"
    end
  end
end

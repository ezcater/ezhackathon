# frozen_string_literal: true

class Award < ApplicationRecord
    validates :title, presence: true

end

class Idea < ApplicationRecord
    validates :name, presence: true
    validates :tagline, presence: true, length: { maximum: 500 }
    validates :description, presence: true
end
class Idea < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :tagline, presence: true, length: { maximum: 500 }
    validates :description, :resources, :snowflake_access, :value_delivered, :goal, :hours_estimate, presence: true
end
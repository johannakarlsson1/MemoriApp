class Card < ApplicationRecord
  belongs_to :deck
  has_many :scores
  has_many :users, through: :score
end

class Note < ApplicationRecord
  belongs_to :food
  validates :body, length: { in: 3..450 }, presence: true
end

class Food < ApplicationRecord
  belongs_to :user
  has_many :notes, dependent: :destroy
  validates :name, length: { in: 2..60 }, presence: true
  validates :date_consumed, presence: true
  validates :servings_consumed, numericality: { greater_than_or_equal_to: 1 }
  validates :carbs, numericality: { greater_than_or_equal_to: 0 }
  validates :fats, numericality: { greater_than_or_equal_to: 0 }
  validates :proteins, numericality: { greater_than_or_equal_to: 0 }

  def self.with_notes(id)
    food = find(id)
    food_and_notes = { id: food.id, name: food.name, date_consumed: food.date_consumed,
                       servings_consumed: food.servings_consumed, carbs: food.carbs,
                       fats: food.fats, proteins: food.proteins, notes: food.notes }

    food_and_notes
  end
end

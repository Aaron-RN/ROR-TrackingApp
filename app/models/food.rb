class Food < ApplicationRecord
  belongs_to :user
  has_many :notes, dependent: :destroy
  validates :name, length: { in: 2..60 }, presence: true
  validates :date_consumed, presence: true
  validates :servings_consumed, numericality: { greater_than_or_equal_to: 1 }
  validates :carbs, numericality: { greater_than_or_equal_to: 0 }
  validates :fats, numericality: { greater_than_or_equal_to: 0 }
  validates :proteins, numericality: { greater_than_or_equal_to: 0 }

  def self.with_notes
    foods = all
    food_with_notes = []
    foods.each do |f|
      food_and_notes = { id: f.id, name: f.name, date_consumed: f.date_consumed,
                         servings_consumed: f.servings_consumed, carbs: f.carbs,
                         fats: f.fats, proteins: f.proteins, notes: f.notes }
      food_with_notes << food_and_notes
    end

    food_with_notes
  end
end

class Food < ApplicationRecord
  belongs_to :user
  has_many :notes, dependent: :destroy
  validates :name, length: { in: 2..60 }, presence: true
  validates :servings_consumed, numericality: { greater_than_or_equal_to: 1 }
  validates :carbs, numericality: { greater_than_or_equal_to: 0 }
  validates :fats, numericality: { greater_than_or_equal_to: 0 }
  validates :proteins, numericality: { greater_than_or_equal_to: 0 }
  before_destroy :destroy_notes

  private
  
  def destroy_notes
    notes.destroy_all
  end
end

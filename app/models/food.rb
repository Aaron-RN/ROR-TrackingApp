class Food < ApplicationRecord
  belongs_to :user
  has_many :notes, dependent: :destroy
  validates :name, length: { in: 2..60 }, presence: true
  before_destroy :destroy_notes
  
  private
  
  def destroy_notes
    notes.destroy_all
  end
end

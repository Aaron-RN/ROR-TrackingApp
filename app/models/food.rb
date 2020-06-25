class Food < ApplicationRecord
  belongs_to :user
  has_many :notes, dependent: :destroy
  validates :name, length: { in: 2..60 }, presence: true
end

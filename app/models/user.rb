class User < ApplicationRecord
  has_secure_password
  has_many :foods, dependent: :destroy
  validates :username, length: { in: 3..32 }, presence: true
  validates_presence_of :email
  validates_uniqueness_of :email, :username
  before_save { username.downcase! }
end

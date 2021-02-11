class Direction < ApplicationRecord
  has_many :services, dependent: :destroy
  validates :name, presence: true
end

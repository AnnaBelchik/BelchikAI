class Direction < ApplicationRecord
  has_many :services, dependent: :destroy
  has_one_attached :image
  validates :name, presence: true
end

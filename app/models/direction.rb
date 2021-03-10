class Direction < ApplicationRecord
  has_many :services, dependent: :destroy
  has_one_attached :image
  validates :name, presence: true

  def self.options_for_select
    all.map do |direction|
      [direction.name, direction.id]
    end
  end
end

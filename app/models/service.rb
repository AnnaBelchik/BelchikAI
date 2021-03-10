class Service < ApplicationRecord
  belongs_to :direction
  has_and_belongs_to_many :records
  has_and_belongs_to_many :doctors
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true
  validates :duration_in_minutes, presence: true


  def self.options_for_select
    all.map do |service|
      [service.name, service.id]
    end
  end
end

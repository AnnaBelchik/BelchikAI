class VisitHistory < ApplicationRecord
  belongs_to :record
  validates :recommendation, presence: true
end

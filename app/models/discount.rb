class Discount < ApplicationRecord
  belongs_to :client

  validates :amount, presence: true
end

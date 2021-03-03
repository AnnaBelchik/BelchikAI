class Client < ApplicationRecord
  has_one :discount
  has_many :records, dependent: :destroy

  validates :surname, presence: true
  validates :forename, presence: true
  validates :middle_name, presence: true
  validates :phone, presence: true, uniqueness: true, phone: true
  validates :password, presence: true, length: { in: 6..20 }

  def self.options_for_select
    all.map do |client|
      ["#{client.surname} #{client.forename}", client.id]
    end
  end

  def check_sign_in(imposed_password)
    password == imposed_password
  end
end

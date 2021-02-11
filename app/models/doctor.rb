class Doctor < ApplicationRecord
  has_and_belongs_to_many :services
  has_and_belongs_to_many :specializations
  has_many :records, dependent: :nullify

  validates :surname, presence: true
  validates :forname, presence: true
  validates :middle_name, presence: true
  validates :category, presence: true
  validates :cabinet, presence: true, numericality: { only_integer: true }
  validates :phone, presence: true, phone: true
  validates :start_work_time, presence: true
  validates :end_work_time, presence: true
  validates :password, presence: true, length: { in: 6..20 }

  def self.options_for_select
    all.map do |doctor|
      ["#{doctor.surname} #{doctor.forname}", doctor.id]
    end
  end
end

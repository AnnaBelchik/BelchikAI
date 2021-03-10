class Doctor < ApplicationRecord
  has_many :doctors_services
  has_and_belongs_to_many :services
  has_and_belongs_to_many :specializations
  has_many :records, dependent: :nullify
  has_one_attached :avatar

  validates :surname, presence: true
  validates :forname, presence: true
  validates :middle_name, presence: true
  validates :cabinet, presence: true, numericality: { only_integer: true }
  validates :phone, presence: true, phone: true, uniqueness: true
  validates :start_work_time, presence: true
  validates :end_work_time, presence: true
  validates :password, presence: true, length: { in: 6..20 }

  def full_name
    "#{surname} #{forname} #{middle_name}"
  end

  def free_time(date)
    records.map do |record|
      next if record.service.blank?

      record.record_datetime..(record.record_datetime.strftime('%H:%M') + record.service&.duration_in_minutes&.minutes)
    end
  end

  def self.options_for_select
    all.map do |doctor|
      ["#{doctor.surname} #{doctor.forname}", doctor.id]
    end
  end
end

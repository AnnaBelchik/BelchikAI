class Record < ApplicationRecord
  belongs_to :doctor
  belongs_to :client
  belongs_to :service
  has_one :visit_history, dependent: :destroy

  validates :record_datetime, presence: true

  before_save :set_cost

  PERCENT_LIMIT = 100

  def set_cost
    self.total_cost = service.price *
      ((PERCENT_LIMIT - client.discount&.amount.to_i) / PERCENT_LIMIT.to_f).to_f
  end

  def self.options_for_select
    all.map do |record|
      ["#{record.record_datetime&.strftime('%Y.%m.%d %H:%M')} #{record.client.surname} #{record.client.forename}",
       record.id]
    end
  end

  def cancel
    update!(canceled: true)
  end
end

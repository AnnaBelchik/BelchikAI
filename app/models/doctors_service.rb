class DoctorsService < ApplicationRecord
  belongs_to :doctor
  belongs_to :service
end

module DirectionsHelper
  def doctors_from_direction(direction)
    Doctor.distinct.joins(:doctors_services).where('doctors_services.service_id IN (?)', direction.services.pluck(:id))
  end
end

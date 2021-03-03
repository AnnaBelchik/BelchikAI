class ApplicationController < ActionController::Base
  helper_method :current_client

  def current_client
    session[:client_id].present? ? (@current_client ||= Client.find_by_id(session[:client_id])) : nil
  end

  private

  def set_main_data
    @directions = Direction.select(:id, :name).includes(image_attachment: :blob)
    @services = Service.select(:id, :name)
    @doctors = Doctor.includes(:specializations, avatar_attachment: :blob)
                     .select(:id, :surname, :forname, :middle_name, :category)
    @guest_question = GuestQuestion.new
  end
end

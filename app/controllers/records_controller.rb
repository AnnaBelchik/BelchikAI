class RecordsController < ApplicationController
  before_action :set_main_data

  def new
    redirect_to new_client_path unless current_client

    @service = Service.find(params[:service_id])
    if @service
      @select_doctors = @service.doctors.map{|doctor| [doctor.full_name, doctor.id]}
    end
    @record = Record.new
  end

  def create
    @record = current_client&.records&.new(record_params.except(:date_record, :time_record).merge(record_date_time))
    if @record.save
      redirect_to client_path(current_client), notice: 'Ваш заказ был успешно сделан! Будет ждать вас в это время'
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def cancel
    @record = Record.find(params[:record_id])
    if @record.cancel
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def record_params
    @record_params ||= params.require(:record).permit(:service_id, :client_id, :doctor_id,
                                                      :date_record, :time_record)
  end

  def record_date_time
    time = Time.parse(record_params.slice(:time_record)[:time_record])
    date = record_params.slice(:date_record)[:date_record]&.to_date
    { record_datetime: (date + time.seconds_since_midnight.seconds).to_datetime }
  end
end

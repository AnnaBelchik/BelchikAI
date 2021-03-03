ActiveAdmin.register Record do
  permit_params :record_datetime, :total_cost, :doctor_id, :client_id, :service_id

  form do |f|
    f.inputs I18n.t('activerecord.models.record') do
      input :doctor, as: :select, collection: Doctor.options_for_select
      input :client, as: :select, collection: Client.options_for_select
      input :service, as: :select, collection: Service.options_for_select
      input :canceled
      input :record_datetime, as: :date_time_picker
    end
    f.actions
  end
end

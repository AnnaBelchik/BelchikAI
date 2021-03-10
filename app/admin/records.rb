ActiveAdmin.register Record do
  permit_params :record_datetime, :total_cost, :doctor_id, :client_id, :service_id

  form do |f|
    f.inputs I18n.t('activerecord.models.record') do
      input :doctor, as: :select, collection: Doctor.options_for_select
      input :client, as: :select, collection: Client.options_for_select
      input :service, as: :select, collection: Service.options_for_select
      input :record_datetime, as: :datetime_picker
    end
    f.actions
  end

  index do
    selectable_column
    column :record_datetime
    column :total_cost
    column :doctor do |record|
      record.doctor.full_name
    end
    column :client do |record|
      record.client.full_name
    end
    column :service
    actions
  end
end

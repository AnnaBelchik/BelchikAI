ActiveAdmin.register Doctor do
  permit_params :surname, :forname, :middle_name, :category, :cabinet, :phone, :start_work_time,
                 :end_work_time, :day_time, :login, :password, :avatar, specialization_ids: [], service_ids: []

  index do
    selectable_column
    column 'Image' do |event|
      event.avatar.attached? && link_to(image_tag(event.avatar, height: '100'))
    end
    column :surname
    column :forname
    column :middle_name
    column :category
    column :cabinet
    column :phone
    column :start_work_time
    column :end_work_time
    column :specializations
    column :services
    actions
  end

  form do |f|
    f.inputs 'Doctor' do
      input :avatar, as: :file
      input :surname
      input :forname
      input :middle_name
      input :category
      input :cabinet
      input :phone if f.object.new_record?
      input :password if f.object.new_record?
      input :start_work_time, input_html: { placeholder: '09:00' }
      input :end_work_time, input_html: { placeholder: '17:00' }
      input :specializations, as: :select, input_html: { multiple: true }
      input :services, as: :select, input_html: { multiple: true }
    end
    f.actions
  end
end

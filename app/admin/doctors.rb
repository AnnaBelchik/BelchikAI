ActiveAdmin.register Doctor do
  permit_params :surname, :forname, :middle_name, :category, :cabinet, :phone, :start_work_time,
                 :end_work_time, :day_time, :login, :password, :avatar, specialization_ids: [], service_ids: []

  before_action :remove_password_params_if_blank, only: [:update]

  controller do
    def remove_password_params_if_blank
      if params[:doctor][:password].blank?
        params[:doctor].delete(:password)
      end
    end
  end

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
      input :avatar, as: :file, hint: object.new_record? ? '' : image_tag(object.avatar, height: '100')
      input :surname
      input :forname
      input :middle_name
      input :category
      input :cabinet
      input :phone, input_html: { value: f.object.new_record? ?  '+375' : f.object.phone }
      input :password
      input :start_work_time, input_html: { placeholder: '09:00' }
      input :end_work_time, input_html: { placeholder: '17:00' }
      input :specializations, as: :select, input_html: { multiple: true }
      input :services, as: :select, input_html: { multiple: true }
    end
    f.actions
  end
end

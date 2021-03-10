ActiveAdmin.register Client do
  permit_params :surname, :forename, :middle_name, :birthday, :street, :number_home,
                :number_appartment, :phone, :password

  index do
    selectable_column
    column :surname
    column :forename
    column :middle_name
    column :phone
    column :birthday
    column :street
    column :number_home
    column :number_appartment
    column :login
    actions
  end

  form do |f|
    f.inputs 'client' do
      input :surname
      input :forename
      input :middle_name
      input :birthday, as: :datetime_picker
      input :street
      input :number_home
      input :number_appartment
      input :phone, input_html: { value: f.object.new_record? ?  '+375' : f.object.phone }
    end
    f.actions
  end
end

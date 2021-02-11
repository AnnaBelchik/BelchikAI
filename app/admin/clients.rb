ActiveAdmin.register Client do
  permit_params :surname, :forename, :middle_name, :birthday, :street, :number_home,
                :number_appartment, :phone, :login, :password, :created_at, :updated_at

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
end

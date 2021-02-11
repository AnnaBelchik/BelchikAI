ActiveAdmin.register Direction do
  permit_params :name, :created_at, :updated_at

  index do
    selectable_column
    column :name
    actions
  end
end

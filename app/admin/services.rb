ActiveAdmin.register Service do
  permit_params :name, :price, :duration_in_minutes, :direction_id

  index do
    selectable_column
    column :direction
    column :name
    column :price
    column :duration_in_minutes
    actions
  end
end

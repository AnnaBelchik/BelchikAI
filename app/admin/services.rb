ActiveAdmin.register Service do
  actions :all
  permit_params :count_procedures, :description, :name, :contraindication,
                :price, :duration_in_minutes, :direction_id, :recent, :popular

  index do
    selectable_column
    column :direction
    column :name
    column :description do |service|
      truncate(service.description, omision: '...', length: 50)
    end
    column :count_procedures
    column :contraindication do |service|
      truncate(service.contraindication, omision: '...', length: 50)
  end
    column :price
    column :duration_in_minutes
    column :recent
    column :popular
    actions
  end
end

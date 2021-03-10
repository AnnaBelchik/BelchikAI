ActiveAdmin.register Service do
  actions :all
  permit_params :count_procedures, :description, :name, :contraindication,
                :price, :duration_in_minutes, :direction_id, :recent, :popular, :image

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

  form do |f|
    f.inputs 'Service' do
      input :image, as: :file, hint: image_tag(object.image, height: '100')
      input :count_procedures
      input :description
      input :name
      input :contraindication
      input :price
      input :duration_in_minutes
      input :direction
      input :recent
      input :popular
    end
    f.actions
  end
end

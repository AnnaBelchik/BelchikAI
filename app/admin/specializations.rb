ActiveAdmin.register Specialization do
  permit_params :name, :created_at, :updated_at

  index do
    selectable_column
    column :name
    actions
  end

  form do |f|
    f.inputs I18n.t('activerecord.models.specialization') do
      input :name
    end
    f.actions
  end
end

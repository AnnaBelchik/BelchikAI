ActiveAdmin.register Direction do
  permit_params :name, :image, :recent, :popular, :description

  index do
    selectable_column
    column I18n.translate('activerecord.attributes.direction.image') do |event|
      event.image.attached? && link_to(image_tag(event.image, height: '100'))
    end
    column :name
    column :description
    actions
  end

  form do |f|
    f.inputs I18n.translate('activerecord.models.direction') do
      input :image, as: :file, hint: image_tag(object.image, height: '100')
      input :name
      input :description
    end
    f.actions
  end

end

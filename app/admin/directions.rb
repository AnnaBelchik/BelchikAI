ActiveAdmin.register Direction do
  permit_params :name, :image, :recent, :popular

  index do
    selectable_column
    column I18n.translate('activerecord.attributes.direction.image') do |event|
      event.image.attached? && link_to(image_tag(event.image, height: '100'))
    end
    column :name
    actions
  end

  form do |f|
    f.inputs I18n.translate('activerecord.models.direction') do
      input :image, as: :file
      input :name
    end
    f.actions
  end

end

ActiveAdmin.register Discount do
  permit_params :amount, :client

  index do
    selectable_column
    column :client
    column :amount
    actions
  end
end

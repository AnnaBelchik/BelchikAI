class AddFieldsToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :description, :text
    add_column :services, :count_procedures, :string
    add_column :services, :contraindication, :text
  end
end

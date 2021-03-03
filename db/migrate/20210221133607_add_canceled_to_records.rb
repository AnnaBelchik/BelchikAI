class AddCanceledToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :canceled, :boolean, default: false
  end
end

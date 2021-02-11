class AddServiceIdToRecords < ActiveRecord::Migration[6.0]
  def change
    add_reference :records, :service
  end
end

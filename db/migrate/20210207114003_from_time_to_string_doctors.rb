class FromTimeToStringDoctors < ActiveRecord::Migration[6.0]
  def change
    change_column :doctors, :end_work_time, :string
    change_column :doctors, :start_work_time, :string
  end
end

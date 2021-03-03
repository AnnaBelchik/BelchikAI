class RemoveWorkDaysFromDoctor < ActiveRecord::Migration[6.0]
  def change
    remove_column :doctors, :day_time, :string
  end
end

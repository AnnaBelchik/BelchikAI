class AddDurationToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :duration_in_minutes, :integer
  end
end

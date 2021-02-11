class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :surname
      t.string :forename
      t.string :middle_name
      t.string :category
      t.integer :cabinet
      t.string :phone
      t.datetime :start_work_time
      t.datetime :end_work_time
      t.string :day_time
      t.string :login
      t.string :password

      t.timestamps
    end
  end
end

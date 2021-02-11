class CreateDoctorsServices < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors_services do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :surname
      t.string :forename
      t.string :middle_name
      t.datetime :birthday
      t.string :street
      t.integer :number_home
      t.integer :number_appartment
      t.string :phone
      t.string :login
      t.string :password

      t.timestamps
    end
  end
end

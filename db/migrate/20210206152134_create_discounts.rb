class CreateDiscounts < ActiveRecord::Migration[6.0]
  def change
    create_table :discounts do |t|
      t.integer :amount
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end

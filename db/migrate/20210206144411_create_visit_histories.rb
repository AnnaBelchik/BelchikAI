class CreateVisitHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :visit_histories do |t|
      t.text :recommendation
      t.references :record, null: false, foreign_key: true

      t.timestamps
    end
  end
end

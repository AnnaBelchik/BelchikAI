class CreateGuestQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :guest_questions do |t|
      t.string :name
      t.string :phone
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end

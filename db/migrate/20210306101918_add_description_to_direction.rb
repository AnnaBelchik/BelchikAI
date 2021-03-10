class AddDescriptionToDirection < ActiveRecord::Migration[6.0]
  def change
    add_column :directions, :description, :text
  end
end

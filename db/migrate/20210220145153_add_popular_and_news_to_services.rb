class AddPopularAndNewsToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :recent, :boolean, default: false
    add_column :services, :popular, :boolean, default: false
  end
end

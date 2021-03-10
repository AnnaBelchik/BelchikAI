class DeleteLoginFromClient < ActiveRecord::Migration[6.0]
  def change
    remove_column :clients, :login, :string
    remove_column :doctors, :login, :string
  end
end

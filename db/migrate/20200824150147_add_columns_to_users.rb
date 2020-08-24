class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :string
    add_column :users, :name, :string
    add_column :users, :description, :string
    add_column :users, :industry, :string
  end
end

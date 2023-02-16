class AddFullNameColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :full_name, :string, null: false
  end
end

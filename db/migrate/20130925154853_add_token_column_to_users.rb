class AddTokenColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :token, :string, unique: true, null: false
  end
end

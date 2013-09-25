class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.belongs_to :follower, null: false
      t.belongs_to :fundraiser, null: false
      t.integer :amount, default: 0
      t.timestamps
    end
  end
end

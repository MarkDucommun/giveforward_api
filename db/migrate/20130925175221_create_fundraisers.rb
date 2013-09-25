class CreateFundraisers < ActiveRecord::Migration
  def change
    create_table :fundraisers do |t|
      t.belongs_to :owner, null: false
      t.string :name, unique: true, null: false
      t.text :description, null: false
      t.integer :goal, default: 0
      t.timestamps
    end
  end
end

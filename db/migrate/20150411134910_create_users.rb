class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :answered
      t.decimal :common
      t.string :picture

      t.timestamps null: false
    end
  end
end

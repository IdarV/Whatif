class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :total_taken
      t.integer :yes
      t.integer :no

      t.timestamps null: false
    end
  end
end

class AddIfToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :if, :string
  end
end

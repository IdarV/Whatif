class AddThenToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :then, :string
  end
end

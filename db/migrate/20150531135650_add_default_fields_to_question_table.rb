class AddDefaultFieldsToQuestionTable < ActiveRecord::Migration
  def change
    change_column :questions, :total_taken, :integer, :default => 0
    change_column :questions, :yes, :integer, :default => 0
    change_column :questions, :no, :integer, :default => 0
  end
end

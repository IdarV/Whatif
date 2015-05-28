class SetDefaultValuesToUsers < ActiveRecord::Migration
  def change
    change_column :users, :common, :integer, :default => 0
    change_column :users, :answered, :integer, :default => 0
  end
end

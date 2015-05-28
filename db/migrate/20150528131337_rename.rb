class Rename < ActiveRecord::Migration
  def change
      remove_column :users, :common
      add_column :users, :common, :integer
  end
end

class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :questions, :then, :but
    rename_column :questions, :if, :whatif
  end
end

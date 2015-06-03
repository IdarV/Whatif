class RemoveAuthorNameFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :author_name, :string
  end
end

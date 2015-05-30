class AddAuthorIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :author_name, :string, default: 'anonymous'
  end
end

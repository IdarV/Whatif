class SetDefaultUserImage < ActiveRecord::Migration
  def change
    change_column :users, :picture, :string, :default => "http://res.cloudinary.com/whatifapp/image/upload/v1432836484/stranger.jpg"
  end
end

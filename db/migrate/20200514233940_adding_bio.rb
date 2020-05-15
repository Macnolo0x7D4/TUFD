class AddingBio < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bio, :string, :null => false, :default => ""
  end
end

class AddTrackablesUsers < ActiveRecord::Migration[6.0]
  def change
    # t.integer  :sign_in_count, default: 0, null: false
    # t.datetime :current_sign_in_at
    # t.string   :current_sign_in_ip
    add_column :users, :sign_in_count, :integer, null: false, default: 0
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
  end
end

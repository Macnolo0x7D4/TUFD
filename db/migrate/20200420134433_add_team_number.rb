class AddTeamNumber < ActiveRecord::Migration[6.0]
  #     User - Columns
  #     t.string "email", default: "", null: false
  #     t.string "encrypted_password", default: "", null: false
  #     t.integer "level", default: 0, null: false
  #     t.string "reset_password_token"
  #     t.datetime "reset_password_sent_at"
  #     t.datetime "remember_created_at"
  #     t.datetime "last_sign_in_at"
  #     t.string "last_sign_in_ip"
  #     t.datetime "created_at", precision: 6, null: false
  #     t.datetime "updated_at", precision: 6, null: false
  #     t.string "username", default: "", null: false
  #     t.integer "sign_in_count", default: 0, null: false
  #     t.datetime "current_sign_in_at"
  #     t.string "current_sign_in_ip"
  #     t.index ["email"], name: "index_users_on_email", unique: true
  #     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  def change
    # t.integer  :sign_in_count, default: 0, null: false
    # t.datetime :current_sign_in_at
    # t.datetime :last_sign_in_at
    # t.string   :current_sign_in_ip
    #
    add_column :admins, :sign_in_count, :integer, default: 0, null: false
    add_column :admins, :current_sign_in_at, :datetime
    add_column :admins, :last_sign_in_at, :datetime
    add_column :admins, :current_sign_in_ip, :string


  end
end

# frozen_string_literal: true

class AddingUsername < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string, null: false, default: ''
  end
end

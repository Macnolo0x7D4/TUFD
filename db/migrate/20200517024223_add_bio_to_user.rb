# frozen_string_literal: true

class AddBioToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bio, :string, null: false, default: ''
  end
end

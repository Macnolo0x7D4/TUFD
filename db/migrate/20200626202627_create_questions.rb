class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :content
      t.boolean :answered
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

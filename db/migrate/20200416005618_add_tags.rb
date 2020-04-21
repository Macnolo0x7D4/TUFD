class AddTags < ActiveRecord::Migration[6.0]
  def change
    change_column "articles", "tags", :index, array:true, default: []
  end
end

class AddIndexToTags < ActiveRecord::Migration[6.0]
  def change
    add_index :tags, :name, length: 30
  end
end

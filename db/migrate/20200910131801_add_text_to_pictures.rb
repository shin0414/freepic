class AddTextToPictures < ActiveRecord::Migration[6.0]
  def change
    add_column :pictures, :text, :text
  end
end

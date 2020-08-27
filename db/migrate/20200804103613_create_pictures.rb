class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.string :name
      t.text :text
      t.text :image
      t.timestamps
    end
  end
end

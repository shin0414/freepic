class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.string :src
      t.references :place
      t.timestamps
    end
  end
end

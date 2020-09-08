class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :title, null: false
      t.text :explanation
      t.timestamps
    end
  end
end

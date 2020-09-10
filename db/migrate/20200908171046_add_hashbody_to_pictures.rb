class AddHashbodyToPictures < ActiveRecord::Migration[6.0]
  def change
    add_column :pictures, :hashbody, :string
  end
end

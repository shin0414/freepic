class AddReferencesToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_reference :places, :user, null: false, foreign_key: true
  end
end

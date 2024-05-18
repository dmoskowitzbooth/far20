class AddDiscToNotes < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :disc_id, :integer
  end
end

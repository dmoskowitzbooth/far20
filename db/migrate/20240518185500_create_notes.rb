class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.integer :emp_id
      t.integer :sup_id
      t.date :date
      t.string :title
      t.string :note

      t.timestamps
    end
  end
end

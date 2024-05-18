class CreateDisciplines < ActiveRecord::Migration[7.0]
  def change
    create_table :disciplines do |t|
      t.integer :emp_id
      t.integer :sup_id
      t.string :level
      t.date :effective
      t.date :expires
      t.string :reason
      t.string :expectations
      t.string :notes
      t.string :title_for

      t.timestamps
    end
  end
end

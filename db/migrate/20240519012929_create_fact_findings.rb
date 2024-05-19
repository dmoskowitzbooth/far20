class CreateFactFindings < ActiveRecord::Migration[7.0]
  def change
    create_table :fact_findings do |t|
      t.integer :emp_id
      t.date :date
      t.time :time
      t.integer :sup_id
      t.string :notes
      t.string :to_discuss

      t.timestamps
    end
  end
end

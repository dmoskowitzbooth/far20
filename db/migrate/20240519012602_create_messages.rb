class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :emp_id
      t.integer :sup_id
      t.string :subject
      t.string :message

      t.timestamps
    end
  end
end

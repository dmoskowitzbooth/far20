class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :base
      t.string :position
      t.integer :emp_id
      t.string :doh
      t.string :access
      t.string :image

      t.timestamps
    end
  end
end

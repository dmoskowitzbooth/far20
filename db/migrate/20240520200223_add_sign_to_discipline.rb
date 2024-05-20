class AddSignToDiscipline < ActiveRecord::Migration[7.0]
  def change
    add_column :disciplines, :fasign, :string
  end
end

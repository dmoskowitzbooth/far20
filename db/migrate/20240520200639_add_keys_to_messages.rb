class AddKeysToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :disc_id, :integer
    add_column :messages, :ffm_id, :integer
  end
end

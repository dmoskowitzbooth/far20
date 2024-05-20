class AddResponseToFactFinding < ActiveRecord::Migration[7.0]
  def change
    add_column :fact_findings, :response, :string
  end
end

class AddDate2AndTime2ToFactFindings < ActiveRecord::Migration[7.0]
  def change
    add_column :fact_findings, :date2, :date
    add_column :fact_findings, :time2, :time
  end
end

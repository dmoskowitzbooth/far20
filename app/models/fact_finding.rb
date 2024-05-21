# == Schema Information
#
# Table name: fact_findings
#
#  id         :integer          not null, primary key
#  conclusion :string
#  date       :date
#  date2      :date
#  notes      :string
#  response   :string
#  time       :time
#  time2      :time
#  to_discuss :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  emp_id     :integer
#  sup_id     :integer
#
class FactFinding < ApplicationRecord
  has_one :message
end

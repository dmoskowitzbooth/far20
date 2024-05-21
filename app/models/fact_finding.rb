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
  belongs_to :employee, class_name: 'Employee', primary_key: :emp_id, foreign_key: :emp_id
  belongs_to :supervisor, class_name: 'Employee', primary_key: :emp_id, foreign_key: :sup_id
end

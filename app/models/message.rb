# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  message    :string
#  read       :boolean
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  disc_id    :integer
#  emp_id     :integer
#  ffm_id     :integer
#  sup_id     :integer
#
class Message < ApplicationRecord
  belongs_to :employee, class_name: 'Employee', primary_key: :emp_id, foreign_key: :emp_id
  belongs_to :supervisor, class_name: 'Employee', primary_key: :emp_id, foreign_key: :sup_id
  belongs_to :fact_finding, foreign_key: :ffm_id

end

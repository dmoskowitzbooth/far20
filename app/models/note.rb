# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  date       :date
#  note       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  disc_id    :integer
#  emp_id     :integer
#  sup_id     :integer
#
class Note < ApplicationRecord

  belongs_to :employee, class_name: 'Employee', primary_key: :emp_id, foreign_key: :emp_id
  belongs_to :supervisor, class_name: 'Employee', primary_key: :emp_id, foreign_key: :sup_id

end

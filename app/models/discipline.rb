# == Schema Information
#
# Table name: disciplines
#
#  id           :integer          not null, primary key
#  effective    :date
#  expectations :string
#  expires      :date
#  level        :string
#  notes        :string
#  reason       :string
#  title_for    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  emp_id       :integer
#  sup_id       :integer
#
class Discipline < ApplicationRecord
  belongs_to :employee, class_name: 'Employee', primary_key: :emp_id, foreign_key: :emp_id
  belongs_to :supervisor, class_name: 'Employee', primary_key: :emp_id, foreign_key: :sup_id
end

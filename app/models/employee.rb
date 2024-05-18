# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  access     :string
#  base       :string
#  doh        :string
#  email      :string
#  first_name :string
#  image      :string
#  last_name  :string
#  phone      :string
#  position   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  emp_id     :integer
#
class Employee < ApplicationRecord
  validates :emp_id, uniqueness: true
  before_create :create_user

  private

  def create_user
    User.create!(
      email: self.email,
      emp_id: self.emp_id,
      password: 'password',  # Default password
      password_confirmation: 'password'  # Ensure password confirmation matches
    )
  end

  has_many :disciplines_as_employee, class_name: 'Discipline', primary_key: :emp_id, foreign_key: :emp_id
  has_many :disciplines_as_supervisor, class_name: 'Discipline', primary_key: :emp_id, foreign_key: :sup_id

  has_many :notes_as_employee, class_name: 'Note', primary_key: :emp_id, foreign_key: :emp_id
  has_many :notes_as_supervisor, class_name: 'Note', primary_key: :emp_id, foreign_key: :sup_id
end
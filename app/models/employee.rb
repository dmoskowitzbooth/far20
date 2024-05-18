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
end

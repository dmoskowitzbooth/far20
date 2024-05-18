# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  access     :string
#  base       :string
#  doh        :string
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
end

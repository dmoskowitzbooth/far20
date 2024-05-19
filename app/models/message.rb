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
#  emp_id     :integer
#  sup_id     :integer
#
class Message < ApplicationRecord
end

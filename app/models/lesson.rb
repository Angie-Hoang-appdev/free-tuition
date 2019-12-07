# == Schema Information
#
# Table name: lessons
#
#  id         :integer          not null, primary key
#  feedback   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :integer
#  teacher_id :integer
#

class Lesson < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
end

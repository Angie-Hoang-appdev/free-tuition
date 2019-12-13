# == Schema Information
#
# Table name: lessons
#
#  id               :integer          not null, primary key
#  feedback         :string
#  rating           :integer
#  teacher_response :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  student_id       :integer
#  teacher_id       :integer
#

class Lesson < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  
  def teacher
    return Teacher.where({:id => self.teacher_id}).at(0).name
  end

  def student
    return Student.where({:id => self.student_id}).at(0).name
  end

end

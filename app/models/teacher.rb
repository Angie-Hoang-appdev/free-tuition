# == Schema Information
#
# Table name: teachers
#
#  id              :integer          not null, primary key
#  email           :string
#  expertise       :string
#  name            :string
#  password_digest :string
#  rating          :string
#  schedule        :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Teacher < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  validates :name, :presence => true
  has_secure_password
  has_many :tuitions, :class_name => "Lesson", :dependent => :destroy

  def average_rating
    all_lessons = Lesson.where({:teacher_id => self.id}).first
    total= Lesson.where({:teacher_id => self.id}).pluck(:rating).sum.to_f
    count= Lesson.where({:teacher_id => self.id}).pluck(:rating).count.to_f
    if all_lessons == nil
      return "No lessons yet. Rating not available."
    else
      return (total/count).round(2)
    end
  end

  #Teacher.each do |teacher|
  #  teacher.rating = teacher.average_rating
  #end 
end


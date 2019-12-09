# == Schema Information
#
# Table name: students
#
#  id              :integer          not null, primary key
#  email           :string
#  grade           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Student < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  validates :name, :presence => true
  has_secure_password
  has_many :tuitions, :class_name => "Lesson", :dependent => :destroy
end

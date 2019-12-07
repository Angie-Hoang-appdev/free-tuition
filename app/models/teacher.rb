# == Schema Information
#
# Table name: teachers
#
#  id              :integer          not null, primary key
#  email           :string
#  expertise       :string
#  name            :string
#  password_digest :string
#  schedule        :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Teacher < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many :tuitions, :class_name => "Lesson", :dependent => :destroy
end

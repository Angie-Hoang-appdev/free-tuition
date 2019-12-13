class AddTeacherResponseToLesson < ActiveRecord::Migration[6.0]
  def change
  add_column :lessons, :teacher_response, :string
  end
end

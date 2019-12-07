class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.integer :teacher_id
      t.integer :student_id
      t.string :feedback

      t.timestamps
    end
  end
end

class AddBioAndImageToTeacher < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :image, :string
  end
end

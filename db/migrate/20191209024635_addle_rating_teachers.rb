class AddleRatingTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :rating, :string
  end
end

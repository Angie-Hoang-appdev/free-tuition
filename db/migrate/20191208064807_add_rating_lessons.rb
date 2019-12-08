class AddRatingLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :rating, :integer
  end
end

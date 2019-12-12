class AddImageToStudent < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :image, :string
s
add_column :teachers, :image, :string



add_column :teachers, :image, :stringadd_column :students, :bio, :text
  end
end

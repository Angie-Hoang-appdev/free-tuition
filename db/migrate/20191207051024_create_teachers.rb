class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.text :schedule
      t.string :expertise

      t.timestamps
    end
  end
end

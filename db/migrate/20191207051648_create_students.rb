class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :grade

      t.timestamps
    end
  end
end

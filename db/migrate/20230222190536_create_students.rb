class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :age
      t.string :major
      t.integer :instructor_id
      # t.references :instructor, null: false, foreign_key: true

      t.timestamps
    end
  end
end

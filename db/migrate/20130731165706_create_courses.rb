class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :instructor
      t.date :release_date
      t.date :end_date
      t.text :description

      t.timestamps
    end
  end
end

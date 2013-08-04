class CreateCoursesAndUsers < ActiveRecord::Migration
  def up
    create_table :courses_users do |t|
      t.references :course, :user
    end
  end

  def down
    drop_table :courses_users
  end
end

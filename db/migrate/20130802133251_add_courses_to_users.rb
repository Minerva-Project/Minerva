class AddCoursesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :courses, :string
  end
end

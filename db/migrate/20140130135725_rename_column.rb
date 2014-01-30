class RenameColumn < ActiveRecord::Migration
  def up
    rename_column :users, :status, :role
  end

  def down
  end
end

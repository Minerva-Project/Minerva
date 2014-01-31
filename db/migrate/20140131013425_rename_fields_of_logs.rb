class RenameFieldsOfLogs < ActiveRecord::Migration
  def up
    rename_column :logs, :was_created, :action
    rename_column :logs, :created, :target
  end

  def down
  end
end

class RemoveTextFromLogs < ActiveRecord::Migration
  def up
    remove_column :logs, :text
  end

  def down
    add_column :logs, :text, :string
  end
end

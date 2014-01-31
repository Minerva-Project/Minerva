class AddTextToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :text, :string
  end
end

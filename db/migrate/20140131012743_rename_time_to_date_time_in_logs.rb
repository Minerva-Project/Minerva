class RenameTimeToDateTimeInLogs < ActiveRecord::Migration
  def up
    rename_column :logs, :time, :date_time
  end

  def down
  end
end

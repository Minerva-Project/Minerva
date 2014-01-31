class AddTimeToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :time, :datetime
  end
end

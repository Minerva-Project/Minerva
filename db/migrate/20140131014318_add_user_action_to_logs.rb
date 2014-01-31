class AddUserActionToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :user_action, :string
  end
end

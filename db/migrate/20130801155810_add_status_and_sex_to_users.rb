class AddStatusAndSexToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :string
    add_column :users, :sex, :string
  end
end

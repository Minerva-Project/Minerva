class AddWasCreatedAndCreatedToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :was_created, :string
    add_column :logs, :created, :string
  end
end

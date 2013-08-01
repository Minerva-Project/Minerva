class AddObservationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :observation, :text
  end
end

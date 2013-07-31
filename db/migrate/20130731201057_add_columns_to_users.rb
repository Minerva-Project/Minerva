class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birth, :string
    add_column :users, :street_address, :string
    add_column :users, :zip_code, :integer
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :telephone, :string
    add_column :users, :web_site, :string
  end
end

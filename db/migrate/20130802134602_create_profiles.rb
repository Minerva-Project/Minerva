class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :image
      t.string :job
      t.string :school
      t.string :languages
      t.string :religion

      t.timestamps
    end
  end
end

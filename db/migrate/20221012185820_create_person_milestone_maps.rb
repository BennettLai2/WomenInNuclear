class CreatePersonMilestoneMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :person_milestone_maps do |t|
      t.integer :person_id
      t.integer :milestone_id

      t.timestamps
    end
  end
end

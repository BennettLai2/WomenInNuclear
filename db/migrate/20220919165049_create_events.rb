class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.timestamp :start
      t.timestamp :end
      t.integer :points
      t.string :url

      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :meeting_id
      t.integer :points
      t.string :meeting_name
      t.datetime :start_time
      t.datetime :end_time
      t.string :description

      t.timestamps
    end
  end
end

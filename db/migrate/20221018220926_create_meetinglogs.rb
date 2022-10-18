class CreateMeetinglogs < ActiveRecord::Migration[6.1]
  def change
    create_table :meetinglogs do |t|
      t.integer :user_id
      t.integer :meeting_id

      t.timestamps
    end
  end
end

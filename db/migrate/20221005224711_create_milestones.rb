class CreateMilestones < ActiveRecord::Migration[6.1]
  def change
    create_table :milestones do |t|
      t.string :name
      t.integer :points
      t.string :message

      t.timestamps
    end
  end
end

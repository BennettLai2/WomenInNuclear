class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts, id: false, primary_key: :email do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :points, :default =>  0
      t.boolean :admin
      
      t.timestamps
      t.index :email, unique: true
    end
  end
end

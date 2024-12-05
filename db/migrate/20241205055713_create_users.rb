class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :uuid, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.timestamps
      
      t.index :uuid, unique: true
      t.index :email, unique: true
    end
  end
end

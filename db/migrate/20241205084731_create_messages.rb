class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages, id: false do |t|
      t.string :id, primary_key: true
      t.text :content, null: false, limit: 140
      t.references :user, null: false, foreign_key: true, type: :string

      t.timestamps
    end
  end
end

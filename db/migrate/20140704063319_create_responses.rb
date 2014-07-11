class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :name
      t.text :content
      t.integer :keijiban_id
      t.integer :user_id
      t.references :keijiban, index: true
      t.integer :response_user_id
      t.timestamps
    end
  end
end

class CreateKeijibans < ActiveRecord::Migration
  def change
    create_table :keijibans do |t|
      t.string :title
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end

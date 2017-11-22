class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :gender
      t.date :date_of_birth
      t.float :weight
      t.integer :height
      t.integer :activity_level
      t.integer :purpose

      t.timestamps
    end
  end
end

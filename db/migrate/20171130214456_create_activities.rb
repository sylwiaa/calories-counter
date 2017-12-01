class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.integer :duration
      t.date :completed_on
      t.string :activity_type

      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.datetime :event_date
      t.integer :creator_id

      t.timestamps
    end
  end
end

class CreateRegistrations < ActiveRecord::Migration[8.0]
  def change
    create_table :registrations do |t|
      t.references :user_id, null: false, foreign_key: true
      t.references :event_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end

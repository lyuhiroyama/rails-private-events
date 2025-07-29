class RenameRegistrationsToEventRegistrations < ActiveRecord::Migration[8.0]
  def change
    rename_table :registrations, :event_registrations
  end
end

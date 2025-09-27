class AddStatusToEventRegistration < ActiveRecord::Migration[8.0]
  def change
    add_column :event_registrations, :status, :integer
  end
end

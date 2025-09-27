class AddAvailabilityToEvent < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :availability, :integer
  end
end

class AddBrigadeHoursToShows < ActiveRecord::Migration
  def self.up
    add_column :shows, :brigade_hours, :integer
  end

  def self.down
    remove_column :shows, :brigade_hours
  end
end

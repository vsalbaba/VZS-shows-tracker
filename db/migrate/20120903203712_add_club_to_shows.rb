class AddClubToShows < ActiveRecord::Migration
  def self.up
    add_column :shows, :club, :boolean
  end

  def self.down
    remove_column :shows, :club
  end
end

class AddArchivedToShow < ActiveRecord::Migration
  def self.up
    add_column :shows, :archived, :boolean
  end

  def self.down
    remove_column :shows, :archived
  end
end

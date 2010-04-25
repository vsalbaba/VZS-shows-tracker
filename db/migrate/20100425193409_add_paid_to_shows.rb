class AddPaidToShows < ActiveRecord::Migration
  def self.up
    add_column :shows, :paid, :boolean
  end

  def self.down
    remove_column :shows, :paid
  end
end


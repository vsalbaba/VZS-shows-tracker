class AddColumnsToShow < ActiveRecord::Migration
  def self.up
    add_column :shows, :meet_time, :time
    add_column :shows, :end_time, :time
    add_column :shows, :payed_hours, :integer
    add_column :shows, :people, :integer
    add_column :shows, :meet_at, :string
    add_column :shows, :contact, :string
    add_column :shows, :breakfast, :boolean
    add_column :shows, :lunch, :boolean
    add_column :shows, :dinner, :boolean
    add_column :shows, :notes, :text
    add_column :shows, :description, :text
  end

  def self.down
    remove_column :shows, :description
    remove_column :shows, :notes
    remove_column :shows, :dinner
    remove_column :shows, :lunch
    remove_column :shows, :breakfast
    remove_column :shows, :contact
    remove_column :shows, :meet_at
    remove_column :shows, :people
    remove_column :shows, :payed_hours
    remove_column :shows, :end_time
    remove_column :shows, :meet_time
  end
end

class AddWantsPayedToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :wants_payed, :boolean
  end

  def self.down
    remove_column :subscriptions, :wants_payed
  end
end

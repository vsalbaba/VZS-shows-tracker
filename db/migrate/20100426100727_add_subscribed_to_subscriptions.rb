class AddSubscribedToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :subscribed, :boolean
  end

  def self.down
    remove_column :subscriptions, :subscribed
  end
end

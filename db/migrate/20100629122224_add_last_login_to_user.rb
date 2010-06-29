class AddLastLoginToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :last_login, :timedate
  end

  def self.down
    remove_column :users, :last_login
  end
end


class CreateShowsUsers < ActiveRecord::Migration
  def self.up
    create_table :shows_users, :id => false do |t|
      t.belongs_to :show
      t.belongs_to :user
    end

    add_index :shows_users, :show_id
    add_index :shows_users, :user_id
  end

  def self.down
    drop_table :shows_users
  end
end


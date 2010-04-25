class CreateShowsUsers < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.belongs_to :show
      t.belongs_to :user
      t.timestamps
    end

    add_index :subscriptions, :show_id
    add_index :subscriptions, :user_id
  end

  def self.down
    drop_table :subscriptions
  end
end


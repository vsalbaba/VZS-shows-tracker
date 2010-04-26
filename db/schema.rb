# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100426100727) do

  create_table "shows", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "meet_time"
    t.time     "end_time"
    t.integer  "payed_hours"
    t.integer  "people"
    t.string   "meet_at"
    t.string   "contact"
    t.boolean  "breakfast"
    t.boolean  "lunch"
    t.boolean  "dinner"
    t.text     "notes"
    t.text     "description"
    t.boolean  "paid"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "show_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "subscribed"
  end

  add_index "subscriptions", ["show_id"], :name => "index_subscriptions_on_show_id"
  add_index "subscriptions", ["user_id"], :name => "index_subscriptions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "vzs_id"
    t.integer  "auth_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

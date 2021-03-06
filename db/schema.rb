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

ActiveRecord::Schema.define(:version => 20090628215012) do

  create_table "books", :force => true do |t|
    t.string   "url",        :limit => 150
    t.string   "email",      :limit => 60
    t.string   "author",     :limit => 80
    t.string   "title",      :limit => 100
    t.string   "subtitle",   :limit => 60
    t.text     "text"
    t.string   "license",    :limit => 10
    t.string   "locale",     :limit => 5
    t.string   "password",   :limit => 16
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "size"
  end

  add_index "books", ["size"], :name => "index_books_on_size"

end

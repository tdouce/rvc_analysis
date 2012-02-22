# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120222134208) do

  create_table "diver_visits", :force => true do |t|
    t.integer  "diver_id"
    t.integer  "visit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "divers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visits", :force => true do |t|
    t.datetime "dive_start"
    t.datetime "dive_end"
    t.datetime "sample_start"
    t.datetime "sample_end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
    t.integer  "substrate_max_depth"
    t.integer  "substrate_min_depth"
    t.integer  "surface_relief_hard_cat_1"
    t.integer  "surface_relief_hard_cat_2"
    t.integer  "surface_relief_hard_cat_3"
    t.integer  "surface_relief_hard_cat_4"
    t.integer  "surface_relief_hard_cat_5"
  end

end

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

ActiveRecord::Schema.define(:version => 20100812105240) do

  create_table "clozes", :force => true do |t|
    t.integer  "exercise_id"
    t.text     "cloze_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dropdown_definitions", :force => true do |t|
    t.integer  "dropdown_id"
    t.string   "definition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dropdown_options", :force => true do |t|
    t.integer  "dropdown_definition_id"
    t.string   "option"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dropdowns", :force => true do |t|
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", :force => true do |t|
    t.string   "title"
    t.string   "chapter"
    t.text     "question"
    t.text     "help"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marktexts", :force => true do |t|
    t.integer  "exercise_id"
    t.text     "mark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "multiple_choice_options", :force => true do |t|
    t.integer  "multiple_choice_id"
    t.boolean  "check"
    t.string   "option"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "multiple_choices", :force => true do |t|
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "single_choice_options", :force => true do |t|
    t.integer  "single_choice_id"
    t.boolean  "check"
    t.string   "option"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "single_choices", :force => true do |t|
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_sequence_positions", :force => true do |t|
    t.integer  "exercise_id"
    t.string   "type_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

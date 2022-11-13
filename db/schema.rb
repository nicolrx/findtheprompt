# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_13_093641) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "prompt_letters", force: :cascade do |t|
    t.bigint "prompt_id", null: false
    t.integer "word_index"
    t.integer "letter_index"
    t.string "content"
    t.index ["prompt_id"], name: "index_prompt_letters_on_prompt_id"
  end

  create_table "prompts", force: :cascade do |t|
    t.string "image_url"
    t.string "image_source"
    t.string "image_source_url"
    t.string "full_prompt"
    t.datetime "publication_date"
  end

  add_foreign_key "prompt_letters", "prompts"
end

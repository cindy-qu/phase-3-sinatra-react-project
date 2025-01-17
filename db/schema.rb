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
ActiveRecord::Schema.define(version: 2022_10_21_161015) do
# ActiveRecord::Schema.define(version: 2022_10_25_214614) do


  create_table "collections", force: :cascade do |t|
    t.integer "song_rating"
    t.integer "song_id"
    t.integer "user_id"
    t.index ["song_id"], name: "index_collections_on_song_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end



  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "artist"
    t.string "genre"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
  end

end

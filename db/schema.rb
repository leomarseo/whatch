# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_24_140155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "actors", force: :cascade do |t|
    t.string "name", null: false
    t.string "photo_url"
    t.integer "tmdb_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "popularity"
  end

  create_table "available_services", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_available_services_on_movie_id"
    t.index ["service_id"], name: "index_available_services_on_service_id"
  end

  create_table "awards", force: :cascade do |t|
    t.string "award_type"
    t.string "category"
    t.string "year"
    t.bigint "movie_id", null: false
    t.string "awardable_type"
    t.bigint "awardable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["awardable_type", "awardable_id"], name: "index_awards_on_awardable_type_and_awardable_id"
    t.index ["movie_id"], name: "index_awards_on_movie_id"
  end

  create_table "directors", force: :cascade do |t|
    t.string "name"
    t.integer "tmdb_id"
    t.string "photo_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.integer "tmdb_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "joint_achievements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "saved_movie_id", null: false
    t.bigint "achievement_id", null: false
    t.boolean "earned"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["achievement_id"], name: "index_joint_achievements_on_achievement_id"
    t.index ["saved_movie_id"], name: "index_joint_achievements_on_saved_movie_id"
    t.index ["user_id"], name: "index_joint_achievements_on_user_id"
  end

  create_table "joint_genres", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_joint_genres_on_genre_id"
    t.index ["movie_id"], name: "index_joint_genres_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.bigint "director_id"
    t.string "title", null: false
    t.string "original_title"
    t.string "release_date"
    t.integer "runtime"
    t.text "overview"
    t.string "photo_url"
    t.integer "tmdb_id"
    t.float "vote_average"
    t.integer "vote_count"
    t.string "tagline"
    t.integer "belongs_to_collection"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["director_id"], name: "index_movies_on_director_id"
  end

  create_table "saved_movies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "movie_id", null: false
    t.integer "user_rating"
    t.boolean "seen", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_saved_movies_on_movie_id"
    t.index ["user_id"], name: "index_saved_movies_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "company", null: false
    t.string "country", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "starring_actors", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "actor_id", null: false
    t.string "character"
    t.string "photo_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actor_id"], name: "index_starring_actors_on_actor_id"
    t.index ["movie_id"], name: "index_starring_actors_on_movie_id"
  end

  create_table "suggestions", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "tmdb_suggestion_id", null: false
    t.boolean "skip", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_suggestions_on_movie_id"
    t.index ["tmdb_suggestion_id"], name: "index_suggestions_on_tmdb_suggestion_id"
  end

  create_table "tmdb_suggestions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "tmdb_movie_id_list"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tmdb_suggestions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "country"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "available_services", "movies"
  add_foreign_key "available_services", "services"
  add_foreign_key "awards", "movies"
  add_foreign_key "joint_achievements", "achievements"
  add_foreign_key "joint_achievements", "saved_movies"
  add_foreign_key "joint_achievements", "users"
  add_foreign_key "joint_genres", "genres"
  add_foreign_key "joint_genres", "movies"
  add_foreign_key "movies", "directors"
  add_foreign_key "saved_movies", "movies"
  add_foreign_key "saved_movies", "users"
  add_foreign_key "starring_actors", "actors"
  add_foreign_key "starring_actors", "movies"
  add_foreign_key "suggestions", "movies"
  add_foreign_key "suggestions", "tmdb_suggestions"
  add_foreign_key "tmdb_suggestions", "users"
end

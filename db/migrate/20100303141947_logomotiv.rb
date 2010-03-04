class Logomotiv < ActiveRecord::Migration


    create_table "albums" do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "title"
      t.integer  "cover_id"
    end

    create_table "assets" do |t|
      t.string   "data_file_name"
      t.string   "data_content_type"
      t.integer  "data_file_size"
      t.integer  "assetable_id"
      t.string   "assetable_type",    :limit => 25
      t.string   "type",              :limit => 25
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "assets", ["assetable_id", "assetable_type", "type"], :name => "ndx_type_assetable"
    add_index "assets", ["assetable_id", "assetable_type"], :name => "fk_assets"
    add_index "assets", ["user_id"], :name => "fk_user"

    create_table "blocks" do |t|
      t.text     "content"
      t.integer  "page_id"
      t.string   "orientation"
      t.datetime "created_at"
      t.datetime "updated_at"
    end


    create_table "pages" do |t|
      t.integer  "parent_id"
      t.string   "name"
      t.string   "title"
      t.string   "path"
      t.string   "permalink"
      t.text     "content"
      t.string   "template"
      t.integer  "position"
      t.integer  "lft"
      t.integer  "rgt"
      t.boolean  "published"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "photos" do |t|
      t.integer  "item_id"
      t.string   "asset_file_name"
      t.string   "asset_content_type"
      t.integer  "asset_file_size"
      t.datetime "asset_updated_at"
      t.string   "color"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "color_title"
    end

    create_table "posts" do |t|
      t.string   "title"
      t.text     "content"
      t.integer  "page_id"
      t.boolean  "published"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "taggings" do |t|
      t.integer  "tag_id"
      t.integer  "taggable_id"
      t.string   "taggable_type"
      t.datetime "created_at"
    end

    add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
    add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

    create_table "tags" do |t|
      t.string "name"
    end


    create_table "users" do |t|
      t.string   "username"
      t.string   "email"
      t.string   "password_hash"
      t.string   "password_salt"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

end

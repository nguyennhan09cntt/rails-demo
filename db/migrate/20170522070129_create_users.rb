class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table "user", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "Table account" do |t|
	    t.string   "user_name",  limit: 24,  null: false
	    t.string   "password",   limit: 32,  null: false
	    t.string   "name",       limit: 128
	    t.date "birthday"
	    t.datetime "joined_at"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.index ["user_name"], name: "user_name_UNIQUE", unique: true, using: :btree
	  end
  end
end

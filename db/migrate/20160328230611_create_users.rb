class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password_digest
      t.boolean :admin, default: false

      t.timestamps null: false
    end
    add_index "users", "username"
    add_index "users", "last_name"
    add_index "users", "first_name"
  end
end

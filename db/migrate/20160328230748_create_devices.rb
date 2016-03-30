class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :serial_number
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.datetime :departs_at
      t.integer :user_id
      t.string :description
      t.boolean :fifteen_minute_message_sent, { :default => false }
      t.boolean :five_minute_message_sent, { :default => false }

      t.timestamps
    end
  end
end

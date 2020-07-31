class CreatePrayerEntries < ActiveRecord::Migration
  def change
    create_table :prayer_entries do |t|

      t.timestamps null: false
    end
  end
end

class AddTitleToPrayerEntries < ActiveRecord::Migration
  def change
    add_column :prayer_entries, :title, :string
  end
end

#create users and prayer entries

abraham = User.create(name: "Abraham", email: "abraham@me.com", password: "test2468")
joe = User.create(name: "Joe", email: "joe@me.com", password: "test2468")

#prayer entries
PrayerEntry.create(content: "Today I am grateful to wake up.", user_id: abraham.id )

abraham.prayer_entries.create(content: "Today is a great day to rejoice!")

#build = instantiates, similar to using new so we have to call save.
joes_entry = joe.prayer_entries.build(content: "I am grateful for the breeze during a hot summer walk.")
joes_entry.save 
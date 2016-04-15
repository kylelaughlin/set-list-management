# Put your seed data in here. This should be a series of .create! statements for
# each of your relevant models.
#
# You'll run it with rake db:seed

#Create songs
Song.create(title: "----", artist: "----", active: false)
Song.create(title: "3 a.m.", artist: "Matchbox 20")
Song.create(title: "American Band", artist: "Grand Funk Railroad")
Song.create(title: "Any Way You Want It", artist: "Journey")
Song.create(title: "Basket Case", artist: "Greenday")
Song.create(title: "Black Horse and a Cherry Tree", artist: "KT Tunstall")
Song.create(title: "Black Magic Woman", artist: "Carlos Santana")
Song.create(title: "Blue on Black", artist: "Kenny Wayne Shepard")
Song.create(title: "Billie Jean", artist: "Michael Jackson")
Song.create(title: "Born to Be Wild", artist: "Steppenwolf")
Song.create(title: "Born to Run", artist: "Bruce Springsteen")
Song.create(title: "Brick House", artist: "The Commodores")
Song.create(title: "Brown Eyed girl", artist: "Van Morrison")
Song.create(title: "Burning Down the House", artist: "Talking Heads")
Song.create(title: "Cold Hard Bitch", artist: "Jet")
Song.create(title: "Come Together", artist: "The Beatles")
Song.create(title: "Cumbersome", artist: "Seven Mary Three")
Song.create(title: "Dani California", artist: "Red Hot Chili Peppers")
Song.create(title: "December", artist: "Collective Soul")
Song.create(title: "Every Rose Has It's Thorn", artist: "Poison")
Song.create(title: "Foreplay/Long Time", artist: "Boston")
Song.create(title: "Shine", artist: "Collective Soul")
Song.create(title: "The Middle", artist: "Jimmy Eat World")
Song.create(title: "Turn the Page", artist: "Bob Seger")
Song.create(title: "Wagon Wheel", artist: "Darius Rucker")
Song.create(title: "What I like About You", artist: "The Romantics")
Song.create(title: "White Wedding", artist: "Billy Idol")

#Band Members
BandMember.create(name: "Kyle", instrument: "Guitar")
BandMember.create(name: "Jeff", instrument: "Guitar")
BandMember.create(name: "Jon", instrument: "Vocals")

#venues
Venue.create(name: "Bob's Tavern", address: "6212 Havelock Ave, Lincoln, NE 68507")
Venue.create(name: "The Garage", address: "5551 S 48th St, Lincoln, NE 68516")
Venue.create(name: "Soaring Wings", address: "17111 S 138th St, Springfield, NE 68059")

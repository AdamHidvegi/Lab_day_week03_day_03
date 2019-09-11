require('pry')
require_relative("./music_collection/album.rb")
require_relative("./music_collection/artist.rb")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'The Beatles'
  })

artist1.save()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Let it be',
  'genre' => 'pop-rock'
  })

album1.save()

albums = Album.all()
artists = Artist.all()

binding.pry
nil

require('pry')
require_relative("./music_collection/album.rb")
require_relative("./music_collection/artist.rb")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'The Beatles'
  })

  artist2 = Artist.new({
    'name' => 'ACDC'
    })

    artist1.save()
    artist2.save()

    album1 = Album.new({
      'artist_id' => artist1.id,
      'title' => 'Let It Be',
      'genre' => 'pop-rock'
      })

      album2 = Album.new({
        'artist_id' => artist1.id,
        'title' => 'Yellow Submarine',
        'genre' => 'pop-rock'
        })

        album3 = Album.new({
          'artist_id' => artist2.id,
          'title' => 'Highway to Hell',
          'genre' => 'rock'
          })

          album1.save()
          album2.save()
          album3.save()

          album3.delete()

          # album3.title = 'Highway to Heaven'
          # album3.update()

          # albums = Album.all()
          # artists = Artist.all()

          result_artist = Artist.find_artist(artist1.id)

          result_album = Album.find_album(album1.id)

          binding.pry
          nil

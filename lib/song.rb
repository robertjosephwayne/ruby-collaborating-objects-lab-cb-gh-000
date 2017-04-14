class Song
  attr_accessor :name
  attr_reader :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    song_properties = filename.split(" - ")

    artist_name = song_properties[0]
    song_name = song_properties[1]
    genre = song_properties[2]

    song = Song.new(song_name)
    song.artist_name = artist_name
    song
  end

  def artist=(artist)
    @artist = artist
  end

  def artist_name=(artist_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(self)
    @artist = artist
  end
end

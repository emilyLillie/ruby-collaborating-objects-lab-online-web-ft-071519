# class Song 
#   attr_accessor :name, :artist
#   @@all = []
  
#   def initialize(name)
#     @name = name 
#     @@all << self 
#   end 
  
#   def self.all
#     @@all 
#   end 

#   def self.new_by_filename(filename)
#     artist_name, song_name, extra = filename.split(" - ")
#     song = self.new(song_name)
#     artist = Artist.find_or_create_by_name(artist_name)
#     artist.add_song(song)
#   end
  
#   def artist_name=(name)
#     self.artist = Artist.find_or_create_by_name(name)
#     artist.add_song(self)
#   end
# end

class Song
  attr_accessor :name, :artist
 @@all = []
   def initialize(name)
    @name = name
    @@all << self 
  end

   def self.new_by_filename(file)
    artist_name = file.split(" - ")[0]
    song_name = file.split(" - ")[1]
    song = Song.new(song_name)
    song.artist_name = artist_name
    song
  end
  def self.all 
    @@all
  end

   def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
    artist.add_song(self)
  end
end 
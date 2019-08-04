# class Artist
#   attr_accessor :name

#   @@all = []

#   def initialize(name)
#     @name = name
#     @songs= []
#     #@@all << self 
#   end

#   def add_song(song)
#     @songs << song
#     song.artist = self
#     song
#   end

#   def songs
#     @songs
#   end

#   def save
#     @@all << self
#     self
#   end

  

#   def self.find_or_create_by_name(name)
#     self.all.detect {|artist| artist.name == name} || Artist.new(name).save
#   end

#   def print_songs
#     self.songs.each {|song| puts song.name} 
#   end
  
#   def self.all
#   @@all 
#   self.all.select {|artist| song.artist.uniq}
#   end
# end

class Artist
  attr_accessor :name, :songs

   @@all = []

   def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

   def self.all
    @@all
  end

   def self.create(name)
    artist = self.new(name)
    artist.name = name
    artist
  end

   def self.find(name)
    self.all.detect { |artist| artist.name == name }
  end

   def self.find_or_create_by_name(name)
    self.find(name) || self.create(name)
  end

   def add_song(song)
    @songs << song
    song.artist = self
    song
  end

   def print_songs
    songs.each { |song| puts song.name }
  end

  def save 
     @@all << self
  end 
  
   def songs
    Song.all.select do |song|
      song.artist == self
    end
  end
end 

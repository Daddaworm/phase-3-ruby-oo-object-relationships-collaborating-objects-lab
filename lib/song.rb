require 'pry'

class Song
    attr_accessor :artist, :name

    @@all = []


    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end


    def self.new_by_filename(filename)
        # creates a new instance of a song from the file that's passed
        # associates new song instance with the artist from the filename
        name = filename.split(' - ')[1]
        artist_name = filename.split(" - ")[0]
        artist = Artist.new(artist_name)
        song = Song.new(name)
        song.artist = artist
        song
        # binding.pry
    end


    def artist_name=(name)
        #accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute
        artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)  # <=SETS ARTIST RELATIONSHIP TO THE SONG!!!
    end


end
require 'pry'

class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        #songs lists all songs that belong to this artist
        Song.all.select do |song|
            # binding.pry
            song.artist == self
        end
    end

    def add_song(song)
        # keeps track of an artist's songs
        song.artist = self
        # binding.pry
    end

    def self.find_or_create_by_name(name)
        @@all.find do |artist|
            artist.name == name
            # binding.pry
        end || Artist.new(name)
    end

    def print_songs
        self.songs.each do |song|
            puts song.name
        end
    end


end
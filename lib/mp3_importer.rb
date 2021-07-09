
class MP3Importer
    attr_accessor :path


    def initialize(path)
        @path = path
    end


    def files
        @files = @files || Dir.glob("#{path}/*.mp3").map {|file| file.gsub("#{path}/", "")}
        # ALTERNATE WAY
        # @files ||= Dir.glob("#{path}/*.mp3").map {|file| file.gsub("#{path}/", "")}
    end


    def import
        files.each do |file| 
            Song.new_by_filename(file)
        end
    end


end
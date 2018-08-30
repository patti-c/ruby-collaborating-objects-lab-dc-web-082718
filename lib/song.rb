class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.file_formatter(file)
    chomped = file.chomp('.mp3')
    formatted_file = chomped.split(' - ')
  end

  def self.new_by_filename(file_name)
    # First, we format the file into a useable array.
    formatted_file = file_formatter(file_name)
    # Next, we create a new song with the title from the array.
    new_song = Song.new(formatted_file[1])
    # Next, we create a new artist from the mp3 data and add
    # our newly created song to that artist's repertoire.
    Artist.new(formatted_file[0]).add_song(new_song)
    # Finally, we return the song.
    new_song
  end

end

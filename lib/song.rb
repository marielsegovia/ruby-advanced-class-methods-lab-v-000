class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name).nil?
       self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    song = Song.new
    title = file.split(" - ")
    title[1].chomp!(".mp3")
    song.artist_name = title[0]
    song.name = title[1]
    song
  end

  def self.create_from_filename(file)
    song = Song.create
    title = file.split(" - ")
    title[1].chomp!(".mp3")
    song.artist_name = title[0]
    song.name = title[1]
    song
  end

  def self.destroy_all
    @@all.clear
  end


end

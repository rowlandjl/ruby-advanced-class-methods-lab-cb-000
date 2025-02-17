require 'pry'

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
    song.save << song
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
    song.save << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    songs = self.all.sort_by {|song| song.name}
    songs.uniq {|song| song}
  end

  def self.new_from_filename(filename)
    file = filename.sub(".mp3","").split(" - ")
    song = self.new
    song.name = file[1]
    song.artist_name = file[0]
    song
  end

  def self.create_from_filename(filename)
    file = filename.sub(".mp3","").split(" - ")
    song = self.new
    song.name = file[1]
    song.artist_name = file[0]
    song.save
    song 
  end

  def self.destroy_all
    self.all.clear
  end

end

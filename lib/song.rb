class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find do |s| s.name == name end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by! {|s| s.name}
  end

  def self.new_from_filename(filename)
    
    song = self.new
    song.artist_name = filename.split(" - ")[0]
    song.name = filename.gsub(".mp3","").split(" - ")[1]
    song
  end

  def self.create_from_filename(filename)
    song = self.create
    song.artist_name = filename.split(" - ")[0]
    song.name = filename.gsub(".mp3","").split(" - ")[1]
    song
  end

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

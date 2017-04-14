class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    filenames = Dir["#{@path}/*.mp3"]
    formatted_filenames = []

    filenames.each do |filename|
      formatted_filenames << filename.gsub("#{@path}/","")
    end

    formatted_filenames
  end

  def import
    new_songs = []

    self.files.each do |filename|
      new_songs << Song.new_by_filename(filename)
    end

    new_songs
  end
end

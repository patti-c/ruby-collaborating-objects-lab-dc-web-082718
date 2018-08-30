require 'pry'

class MP3Importer

  attr_reader :path, :files

  def initialize(file_path)
    @path = file_path
  end

  def files
    @file_array = Dir.entries(@path)
    @file_array.delete_if{|file| file.include?('mp3') == false}
  end

  def import
    self.files
    @chomped_array = @file_array.map{|file| file.chomp('.mp3')}
    @formatted_array = @chomped_array.map{|file| file.split(' - ')[1]}
    @formatted_array.each {|file| Song.new_by_filename(file)}
  end

end

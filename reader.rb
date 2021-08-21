# frozen_string_literal: true

# return a list of files in the pathh
class Reader
  attr_reader :path, :files

  def initialize(path)
    @path = path
    @files = read_files
  end

  def read_files
    Dir.glob(File.join(@path, '**', '*')).select { |file| File.file?(file) }
  end
end

# frozen_string_literal: true

require 'byebug'
require 'fileutils'

# return a list of files in the pathh
class Writer
  attr_reader :files, :files_rename, :time, :directory

  def initialize(files)
    @time = Time.now
    @directory = create_directory_name
    create_directory
    @files = files
    @files_rename = rename
    copy
  end

  def copy
    @files_rename.map { |file_rename| FileUtils.cp(file_rename[:name], file_rename[:rename]) }
  end

  def create_directory
    FileUtils.mkdir_p(@directory)
  end

  def create_directory_name
    "TMP_REWRITE_#{short_time_zone(@time.to_s)}"
  end

  def short_time_zone(date_string)
    date_string.split(' -')[0].strip
  end

  def rename
    @files.map.with_index do |file, index|
      { name: file, rename: name(file, index) }
    end
  end

  def name(file, index)
    "#{@directory}/#{index}-#{short_time_zone(File.ctime(file).to_s)}#{extension(file)}"
  end

  def extension(file)
    File.extname(file)
  end
end

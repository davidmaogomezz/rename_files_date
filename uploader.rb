# frozen_string_literal: true

require 'byebug'
require_relative 'reader'
require_relative 'config_cloudinary'

# return a list of files in the pathh
class Uploader
  attr_reader :path, :files

  def initialize(path)
    @path = path
    reader = Reader.new(@path)
    @files = reader.files
    upload_files
  end

  def upload_files
    @files.map.with_index { |file, index| file_upload(file, index) }
  end

  def file_upload(file, index)
    Cloudinary::Uploader.upload(file, folder: File.dirname(file), public_id: File.basename(file, '.*'),
                                      overwrite: true, resource_type: 'image')
    message_percentage(index)
  end

  def message_percentage(index)
    puts "-> #{File.basename(path)} #{(index * 100) / @files.length}%" if index.positive?
  end
end

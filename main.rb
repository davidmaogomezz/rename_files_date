# frozen_string_literal: true

require 'byebug'
require_relative 'reader'
require_relative 'writer'
require_relative 'uploader'

path = '/Users/macbook/Downloads'
reader = Reader.new(path)
writer = Writer.new(reader.files)
@uploader = Uploader.new(writer.directory)

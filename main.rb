require_relative 'reader'
require_relative 'writer'

path = '/Users/macbook/Downloads'
reader = Reader.new(path)
writer = Writer.new(reader.files)
puts writer

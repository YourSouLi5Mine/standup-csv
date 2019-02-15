require 'minitest/autorun'
require 'reader'
require 'pry'

class TestReader < MiniTest::Test
  def setup
    @file_rows = { 49 => './csv/cities2.csv', 128 => './csv/cities.csv' }
  end

  def test_initialize
    @file_rows.each do |length, filename|
      assert_equal(length, Reader.new(filename).rows.length)
    end
  end

  def test_to_struct
    @file_rows.each do |length, filename|
      assert_equal(length, Reader.new(filename).to_struct.length)
    end
  end
end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/chisel'

class ChiselTest < Minitest::Test
  def test_it_can_open_file
    chisel = Chisel.new("./lib/something.markdown")
    expected = "#Some Words\n"

    assert_equal expected, chisel.markdown_text
  end
end

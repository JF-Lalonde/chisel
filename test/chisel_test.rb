require 'minitest/autorun'
require 'minitest/pride'
require './lib/chisel'

class ChiselTest < Minitest::Test
  def test_it_can_open_file
    chisel = Chisel.new("./lib/something.markdown")
    expected = ["#Some Words\n"]

    assert_equal expected, chisel.markdown_text
  end

  def test_chisel_reads_lines
    chisel = Chisel.new("./lib/my_input.markdown")
    expected = "## Chapter 1: The Beginning\n"

    assert_equal expected, chisel.markdown_text[2]
  end

end

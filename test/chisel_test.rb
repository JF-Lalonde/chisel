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

  def test_chisel_converts_headers
    chisel = Chisel.new("./lib/my_input.markdown")
    actual = chisel.header_to_html
    expected = "<h2>Chapter 1: The Beginning</h2>"

    assert_equal expected, actual
  end

  def test_chisel_converts_paragraphs
    chisel = Chisel.new("./lib/my_input.markdown")
    actual = chisel.paragraph_to_html
    expected = "<p>**Food & Wine** this place has been packed every night.\"</p>"

    assert_equal expected, actual
  end

  def test_chisel_converts_emphasis
    chisel = Chisel.new("./lib/my_input.markdown")
    actual = chisel.emphasis_to_html
    expected = '"You just <em>have</em> to try the cheesecake," he said. "Ever since it appeared in'

    assert_equal expected, actual
  end

  def test_chisel_converts_strong
    chisel = Chisel.new("./lib/my_input.markdown")
    actual = chisel.strong_to_html
    expected = "<strong>Food & Wine</strong> this place has been packed every night."

    assert_equal expected, actual
  end
end

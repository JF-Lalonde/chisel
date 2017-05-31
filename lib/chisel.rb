class Chisel
  attr_reader :markdown_text

  def initialize(input_file)
    @markdown_text = File.read(input_file)
  end

  def break_into_lines
    markdown_text

  end
end

class Chisel
  attr_reader :markdown_text

  def initialize(input_file)
    @markdown_text = File.readlines(input_file)
  end

  def header_to_html
    markdown_text.each do |line|
      if line.start_with?("#")
        pound = line.count "#"
        front = line.index(" ")
        header_text = line[(front + 1)..-2]
        @headers = "<h#{pound}>#{header_text}</h#{pound}>"
      end
    end
    @headers
  end
end
# chisel = Chisel.new("./lib/my_input.markdown")
# chisel.header_to_html
